render
renderSpace: ogl port: portal depth: depth ghostFrame: ghost

	| currentCamTrans currentPointerTrans currentCameraInv cpt renderPortals renderedObjects ac cp saveEvent |
	ac := ogl camera.

	"ogl glEnable: GLLineSmooth.
	ogl glHint: GLLineSmoothHint with: GLNicest.
	ogl glEnable: GLPolygonSmooth.
	ogl glHint: GLPolygonSmoothHint with: GLNicest.
	ogl glEnable: GLBlend.
	ogl glBlendFunc: GLSrcAlpha with: GLOneMinusSrcAlpha."

"------ The TSpace render method makes two passes. The first pass is used to render the non-alpha objects and to find the alpha objects. The alpha objects and their transforms are put into the SortedCollection alphaObjects. This array is sorted by distance using the bounding spheres of the objects and the second render pass using the renderAlpha method is made in using this sorted order from furthest to closest. Ghost frames are interleaved TFrames that render along side the space. Ghost frames can not contain portals or lights - as these are just ignored. ------"
"------ reset the rayframes if this is the first time through...."
	renderedObjects := 0.
"test ifNotNil:[
ogl eventPointer ifNotNil:[test translation: ogl eventPointer globalPosition + (ogl eventPointer outVector * -50).].]."
	ac transformClipPlanes.
	cpt := ac clipPlanesTransform.
	currentCamTrans := ac globalTransform copy.
	ogl eventPointer ifNotNil:[currentPointerTrans := ogl eventPointer globalTransform copy.].
	currentCameraInv := currentCamTrans orthoNormInverse.
	ogl glLoadTransposeMatrixf: currentCameraInv.
"------ The portals will have to be sorted here.... ------"
"------ Render the portals from back to front. ------"
	(ogl maxPortalDepth > depth and: [ogl suppressPortals not]) ifTrue:[
		renderPortals := OrderedCollection new.
	portalFrames do: [ :pf | 
		(pf isNotPortal3D and:[pf ~= ac currentPortal or:[pf reentrant]])ifTrue:[
		 " ------ is the portal even visible? ------"
		pf visible ifTrue:[
 		" ------ portal facing camera?-----"
		(pf lookAtCamera: ac) ifTrue:[
		"------- is the portal inside the view frustum? ------"
		pf boundSphere transform: pf globalTransform.
		(ac testBounds: pf boundSphere) ifTrue:[
			renderPortals add: pf.
			]. "(ac testBounds: pf boundSphere) ifTrue:"
		]. "(delta dot: pf lookAt)>0 ifTrue:"
		]. "pf visible"
		]. "pf~=ac currentPortal or:[pf reentrant]"
		]. "portalFrames do:"
ogl forcePick ifTrue:[saveEvent:=ogl eventPointer. ogl eventPointer:nil. ].
		(renderPortals asArray sort:[:a1 :a2| a1 cameraDistance < a2 cameraDistance]) do: [:pf | 
			cp := ac currentPortal.
			ac currentPortal: pf.
			renderedObjects := renderedObjects + (pf render: ogl depth: depth). 
			ac currentPortal: cp.
			" ------ restore the camera for the next go round ------ "
			ac globalTransform: currentCamTrans.
			ac clipPlanesTransform: cpt.].
		]. "ogl maxPortalDepth > depth ifTrue:"
 "------ restore camera position and set up clip planes in this pose.------"
	ogl forcePick ifTrue:[ogl eventPointer: saveEvent.].
	ogl eventPointer ifNotNil:[ogl eventPointer globalTransform: currentPointerTrans.].
	ogl glLoadTransposeMatrixf: currentCameraInv.

"------ Once we have rendered all of the subportals, if this is a portal, set its clip plane so that we don't render objects in front of the portal.------"
	portal ifNotNil: [ portal enableClipPlane: ogl. ].
	" create a new array "	

	" turn on the lights and setup the fog "
	self setupLights: ogl.
	fogOn ifTrue:[ self setupFog: ogl. ].
	" cull back faces if necessary."
	self setCull: ogl.
"------ Render non-alpha geometry. While we are at it, find the alpha geometry for the next pass. All TFrames know how to do this, including TSpace. TSpace is a root frame (there is no THE root frame in TEA) so we need only call the TSpace >> renderFrame message to render everything inside of this. ------"
	renderedObjects := renderedObjects + (self renderFrame: ogl ).
	ogl glPushMatrix.
	ghost ifNotNil:[
		renderedObjects := renderedObjects + (ghost renderFrame: ogl ).
	].
	ogl glPopMatrix.
"------ If there are any alpha objects, set render mode to alpha blending and make a second pass. Use alphaLength because alphaObjects size may be bigger than the actual objects rendered. ------"
	(alphaObjects size ~= 0 or:[self forceAlpha])ifTrue:[
		self renderSpaceAlpha: ogl transform: currentCamTrans.
		].

	0 to: 7 do:[ :index | 	ogl glDisable: GLLight0 + index.].
	ogl glDisable: GLCullFace.
	portal ifNotNil: [portal disableClipPlane:ogl.].
	ogl fogOn:false.
"clear this at the end because it contains bad things that can't be replicated"
	alphaObjects := OrderedCollection new: 0. 
	^ renderedObjects. "Return the number of objects we have rendered."