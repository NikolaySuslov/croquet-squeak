render
renderAlpha: ogl

	self renderPrimitive: ogl alpha: true.
	boundMaterial ifNotNil:[
		boundMaterial enable:ogl.
		boundSphere renderTriangles: ogl.
		boundMaterial disable: ogl
	].
