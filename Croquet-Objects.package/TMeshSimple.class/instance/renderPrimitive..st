render
renderPrimitive: ogl

	vertices ifNil: [^super renderPrimitive: ogl].

	normals ifNil: [
		ogl glDisable: GLLighting.
		].
	ogl drawIndexed: mode
		faces: faces
		vertices: vertices
		normals:normals
		colors: colors
		texCoords: texCoords.
	ogl glEnable: GLLighting.
