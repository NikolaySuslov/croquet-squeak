render
renderAlpha: ogl

	ogl glPushMatrix.

	renderObject ifNil: [ renderObject := TCube new. ].
	self enable: ogl.
	renderObject render: ogl.
	self disable: ogl.
	ogl glPopMatrix.