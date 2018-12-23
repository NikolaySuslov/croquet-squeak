render
renderPrimitive: ogl alpha: alphaPass

	| saveFW |
	saveFW := ogl forceWire.
	ogl forceWire: false.
	super renderPrimitive: ogl alpha: alphaPass.
	ogl forceWire: saveFW.
