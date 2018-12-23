accessing
modeName
	mode = GLPoints ifTrue:[^ #GLPoint].
	mode = GLQuads ifTrue:[^ #GLQuads].
	mode = GLTriangles ifTrue:[^ #GLTriangles].
	mode = GLTriangleStrip ifTrue:[^ #GLTriangleStrip].