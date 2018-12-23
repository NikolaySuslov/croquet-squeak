initialization
drawOn: aCanvas

	selectedField ifNotNil:[
		aCanvas frameRectangle: (selectedField bounds translateBy:(-2@0)) color: Color black.].

