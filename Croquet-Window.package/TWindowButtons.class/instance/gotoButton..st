accessing
gotoButton: aButton
	gotoButton ifNotNil:[self removeChild: gotoButton].
	gotoButton := aButton.
	gotoButton ifNotNil:[self addChild: gotoButton].