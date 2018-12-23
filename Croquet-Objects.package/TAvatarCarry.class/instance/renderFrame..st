render
renderFrame: ogl

	| trans rval |
	ogl eventPointer: eventPointer.
	trans := ogl transparency.
	ogl transparency: 1.0.
	rval := super renderFrame: ogl.
	ogl transparency: trans.
	^ rval.