accessing
cameraButton: aButton
	cameraButton ifNotNil:[self removeChild: cameraButton].
	cameraButton := aButton.
	cameraButton ifNotNil:[self addChild: cameraButton].