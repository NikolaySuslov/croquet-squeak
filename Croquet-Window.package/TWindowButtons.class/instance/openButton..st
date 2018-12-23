accessing
openButton: aButton
	openButton ifNotNil:[self removeChild: openButton].
	openButton := aButton.
	openButton ifNotNil:[self addChild: openButton].