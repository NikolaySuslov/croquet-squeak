render
renderAlpha: ogl
	
	| saveFW |
	saveFW := ogl forceWire.
	ogl forceWire: false.
	super renderPrimitive: ogl alpha: true.
	ogl forceWire: saveFW.