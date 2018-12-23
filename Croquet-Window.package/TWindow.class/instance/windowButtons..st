accessing
windowButtons: newButtons
	windowButtons ifNotNil:[self removeChild: windowButtons].
	windowButtons := newButtons.
	windowButtons ifNotNil:[self addChild: windowButtons].
