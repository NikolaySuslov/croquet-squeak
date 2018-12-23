render
renderStencil: ogl depth: depth

	| saveForceWire |
	ogl glDisable: GLLighting.
	ogl glStencilFunc:GLEqual with:depth-1 with: -1.
	ogl glStencilOp:GLKeep with:GLKeep with:GLIncr.

	saveForceWire := ogl forceWire.
	ogl forceWire:false.
	self renderPrimitive: ogl alpha: true.
	ogl forceWire: saveForceWire.

	ogl glStencilFunc: GLEqual with: depth with: -1.
	ogl glStencilOp: GLKeep with: GLKeep with: GLKeep.

	ogl glEnable: GLDepthTest.
	ogl glEnable: GLLighting.
	ogl glPopMatrix.

	ogl glPushMatrix.
