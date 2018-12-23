render
render: ogl
| rval ac currentCameraTrans currentCameraPos cpt toSpace currentPointerTrans currentScale copySelection currentPointer saveEventPointer ttrans offset |

	rval := 0.

"Can't recurse into TPortal3D objects because of the limitation in number of clipping planes. Maybe if I figure out a different way to do it later..."
	ogl inPortal3D ifTrue:[^ rval].
	postcard ifNil:[^ 0 ].
	toSpace := postcard resolveViewpoint: ogl.
	toSpace ifNil:[^ 0 ].
	inPortal ifTrue:[^ 0 ].
	ogl inPortal3D: true.
	inPortal := true.
	ogl glPushMatrix. 
	self enableClipPlanes: ogl.
	ac := ogl camera.
"	ip := ac inPortal.
	ac inPortal: true."
	cpt := ac clipPlanesTransform.
	currentCameraTrans := ac globalTransform copy.
	currentCameraPos := ac globalPosition copy.
	currentScale := ac frameScale.
	ttrans := transform copy.
	offset := ttrans translation.
	ttrans translation: offset * scale.
	ac  globalTransform: (self globalTransform *  ttrans orientation * ttrans translationMatrix)orthoNormInverse * ac globalTransform.
	ac globalPositionForce: ac globalPosition/scale.
	ac transformClipPlanes.
	currentPointer := ogl eventPointer.
	currentPointer ifNotNil:[
		copySelection := currentPointer selection copy.
		currentPointerTrans := currentPointer globalTransform copy.
		ogl eventPointer globalTransform: (ac globalTransform composeWith: currentPointer localTransform).
		currentPointer frameScale: scale.
	"	ac downPointer setAutomatic: false."
	].
	

	ac frameScale: scale.
	ogl glScalef: scale with: scale with: scale.
	ogl glMultTransposeMatrixf: transform orientation. 
	ogl glTranslatef: offset x with: offset y with: offset z.
	ogl forcePick ifTrue:[saveEventPointer := ogl eventPointer. ogl eventPointer:nil].
	toSpace renderSubspace: ogl. ">>>>>>>>>>>>RENDER CALL IS HERE!!!!!<<<<<<<<<<"
	ogl forcePick ifTrue:[ogl eventPointer:saveEventPointer].
	ac globalTransform: currentCameraTrans.
	ac globalPositionForce: currentCameraPos.
	ac clipPlanesTransform: cpt.
	self disableClipPlanes: ogl.
	ogl glPopMatrix.

	ogl inPortal3D: false.
	ac frameScale: currentScale.
	inPortal := false.
" XXXXXXXXXXXXXXXX
Need a way to figure out if this is a viewPortal or not. If so do NOT do this 

	ogl camera currentPortal ifNotNil:[
		ogl camera currentPortal enableClipPlane: ogl.]. 
 XXXXXXXXXXXXXXXXX"
	currentPointer ifNotNil:[
		currentPointer globalTransform: currentPointerTrans.
		currentPointer frameScale: currentScale.
		copySelection target ~= currentPointer selection target ifTrue:[
			currentPointer pointerDown ifFalse:[
			(clipBox pointInBox: currentPointer selectedGlobalPoint+offset*scale)ifFalse:[
				"selected point ain't in the box"
				currentPointer selection: copySelection.
			].
			].
			"ac downPointer setAutomatic: true."
		].
	].
"	ac inPortal: ip."
	
	^ rval.