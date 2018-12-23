drawing
imageForm
	^harness ogl
		ifNil: [super imageForm]
		ifNotNil: [harness ogl screenShot]