Morphic render
beginMorphicOverlay: ogl
	"Set up gl to provide overlay drawing - this is done in pixel coordinates"
	ogl glMatrixMode: GLProjection.
	ogl glPushMatrix.
	ogl glLoadIdentity.
	ogl glMatrixMode: GLModelview.
	ogl glPushMatrix.
	ogl glLoadIdentity.
	ogl glTranslated: -1 with: 1 with: 0.0.
	ogl glScaled: (2.0 / bounds width) with: (-2.0 / bounds height) with: 1.0.
	ogl glDisable: GLDepthTest.
	ogl glEnable: GLBlend.
	ogl glBlendFunc: GLOne with: GLOneMinusSrcAlpha.

