accessing
killButton: aButton
	killButton ifNotNil:[self removeChild: killButton].
	killButton := aButton.
	killButton ifNotNil:[self addChild: killButton].