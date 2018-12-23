render
render: ogl depth: depth
	| trans m2 toSpace gt portalClip clipPlanes renderedObjects ac saveDoSelect saveMinDistance portalDistance vwPnt |

" This method is the recursive portal renderer. If you want the camera entering check out TPortal>>testEnter: ac."

" ------- We keep track of which portal we are currently working in to avoid a tight recursion error,where the portal re-enters itself to render. It is (somewhat) OK to re-enter from another portal. This is equivalent to a mirror in a mirror situation. Here we need to keep a count of the re-entries.------"
	postcard ifNotNil:[vwPnt := postcard resolveViewpoint: ogl.] ifNil:[ vwPnt := self].
	vwPnt ifNil:[ vwPnt := self viewPoint. ]. " make it a mirror for now..."
	vwPnt isFarRef ifTrue: [
		"PC #resolveViewpoint: gives a far ref; we need a near ref for rendering"
		vwPnt wait.
		vwPnt := vwPnt value.	
	].
	toSpace := vwPnt root.
	toSpace ifNil:[^0].

	ogl enterPortal2D.

" ----- Check if the postcard is installed into a TSpace, otherwise we can't render anything"
	toSpace isSpace ifFalse:[ vwPnt := self. toSpace := self root. ]. 
" ------ For rendering the portal ONLY - we turn off depth testing. We just want to write into the stencil buffer here and set the color of the toSpace. Depth testing is turned back on before we recurse into the connected portal.------"
	gt := self globalTransform. 
	depth = 1 ifTrue:[ogl glEnable: GLStencilTest.].
	ogl glPushMatrix. 
	ogl glMultTransposeMatrixf: gt.
	ogl glDisable: GLDepthTest. 

" ------ Prepare to paint the portal with the color of the TSpace ------ "
	self paintPortal: ogl color: toSpace color asVector3.

" ------ Render the stencil here. ------ "
	self renderStencil: ogl depth: depth.

	m2 := vwPnt globalMatrixOut.

" ------- For simplicity - and because I can't think of a good reason not to do this - if a portal points back to itself, it is considered to be a mirror. Note that we flip the directions of the polyon tests as well. This is restored at the end. We are inverting the x-coordinate of the matrix here. ------" 
	self = vwPnt ifTrue:[
		m2 a11: m2 a11 negated.
		m2 a21: m2 a21 negated.
		m2 a31: m2 a31 negated.
		ogl flipFace.].

	ac := ogl camera.
	portalClip :=ac portalClip.
	ac portalClip: m2.

" ------ This math is simply: 

			m1 = trans*m2
			m1 * m2**-1 = trans * m2 * m2**-1
			m1 * m2**-1 = trans. 

 We then replace the transform matrix of the TCamera with the appropriate transform, which places the TCamera into the correct position in the new space.------"
	clipPlanes := ac clipPlanes.
	ac clipPlanes: (self initClipPlanes: ac globalTransform mirror: ogl isMirror).
	self = vwPnt ifTrue:[ ogl mirrorFlip.].
	trans := m2 * gt orthoNormInverse.
	ac globalTransform: (trans * ac globalTransform).
	ogl eventPointer ifNotNil:[
		saveMinDistance := ogl eventPointer minDistance.
		saveDoSelect := ogl eventPointer doSelect.
		portalDistance := self portalPick: ogl eventPointer.
		ogl eventPointer globalTransform: (ac globalTransform * ogl eventPointer localTransform).
		].

" ------ Render TSpace here! -------"
	renderedObjects := 1 + (toSpace renderSpace: ogl port: vwPnt depth: depth+1 ghostFrame: ghost). 
	ac clipPlanes: clipPlanes.
	self = vwPnt ifTrue:[ogl flipFace. ogl mirrorFlip.].
	ogl glPopMatrix.

" ------ Just in case we jumped into a portal, restore the stencil depth ------"
	ogl glStencilFunc: GLLequal with: depth-1 with: -1.
	ogl glStencilOp: GLKeep with: GLKeep with: GLKeep.

"------ Render the front face invisibly to set the z-buffer to ensure nothing bleeds into the portal space from our space. ------"			
	self renderPortal: ogl.

	depth = 1 ifTrue:[ogl glDisable: GLStencilTest.].
	ac portalClip: portalClip.
	ogl eventPointer ifNotNil:[
		ogl eventPointer doSelect: saveDoSelect.
		ogl eventPointer minDistance: saveMinDistance.
		ogl eventPointer maxDistance: (ogl eventPointer maxDistance min: portalDistance).
		].

	ogl leavePortal2D.

	^ renderedObjects.
