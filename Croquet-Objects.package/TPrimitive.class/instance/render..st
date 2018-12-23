render
render: ogl

	material ifNotNil:[material enable: ogl]
		ifNil:[self root defaultMaterial enable:ogl.].
	texture ifNotNil:[texture enable: ogl].
	self renderPrimitive: ogl.
	texture ifNotNil:[texture disable: ogl].
	material ifNotNil:[material disable: ogl]
		ifNil:[self root defaultMaterial disable: ogl].
	
