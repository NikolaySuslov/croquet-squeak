render
render: ogl

	self hasAlpha ifFalse:[
		ogl glPushMatrix.

		renderObject ifNil: [ renderObject := TCube new. renderObject scale: scale.].
		self enable: ogl.
		renderObject render: ogl.
		ogl glPopMatrix.].