as yet unclassified
renderAlpha: ogl

	ogl glDisable: GLCullFace.
	super renderAlpha: ogl.
	ogl setCull.