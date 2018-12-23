render
renderAlpha: ogl
	
	| saveFW |
	saveFW := ogl forceWire.
	ogl forceWire: false.
	cube renderPrimitive: ogl alpha: true.
	ogl forceWire: saveFW.