render
renderAlpha: ogl

	material ifNotNil:[material enable: ogl. ].
	texture ifNotNil:[texture enable: ogl].
	self renderPrimitive: ogl.
	texture ifNotNil:[texture disable: ogl.].
	material ifNotNil:[material disable: ogl.].
