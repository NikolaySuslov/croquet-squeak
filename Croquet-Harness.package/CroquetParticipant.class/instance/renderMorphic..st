Morphic render
renderMorphic: ogl
	"Set up gl to provide overlay drawing - this is done in pixel coordinates"
	| sz |
	ogl glDisable: GLLighting.
	self beginMorphicOverlay: ogl.
	sz := harness formManager findCount.
	sz > 0 ifTrue:[
		ogl drawString: 'Textures to load: ', sz printString
			at: 0@0@0 font: nil color: Color orange align: #topLeft].
	self glRenderMorphicOverlayOn: ogl.
	self endMorphicOverlay: ogl.
	ogl glEnable: GLLighting.
