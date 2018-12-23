render
renderPortal: ogl

	| rval saveForceWire |

"#renderPortal: simply sets up a stencil in the shape of the portal we are about to render through. This is where it happens."
	ogl glPushMatrix.
	saveForceWire := ogl forceWire.
	ogl glPolygonOffset: 2.1 with: 4.0.
	ogl glEnable: GLPolygonOffsetFill.
	ogl glColorMask: 0 with: 0 with: 0 with: 0.
	ogl glMultTransposeMatrixf: self globalTransform.
	ogl forceWire: false.
	rval := self renderPrimitive: ogl alpha: true.
	ogl forceWire: saveForceWire.
	ogl glColorMask:GLTrue with: GLTrue with:GLTrue with:GLTrue.
	ogl glDisable: GLPolygonOffsetFill.
	ogl glPopMatrix.
	^ rval.