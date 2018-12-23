render
renderOverlay: ogl with: overlays

	| fw rval |
	fw := ogl forceWire.
	ogl forceWire: false.
	rval := 0.
	overlays ifNotNil:[
		overlays do:[:ov |
				"reset the buffers"
			ov ifNotNil:[
				ov send:[ :vwPnt |
					vwPnt rearrange: ogl.
					ogl glDepthMask: GLTrue;
						glDisable: GLBlend;
						glClear: (GLDepthBufferBit bitOr: GLStencilBufferBit).
				"and render each overlay"
					rval := rval + (vwPnt renderAsOverlay: ogl).
				].
			].
		].
	].
	ogl forceWire: fw.
	^ rval.