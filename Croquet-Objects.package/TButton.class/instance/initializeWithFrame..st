initialize
initializeWithFrame: fr

	frame := fr.
	self addChild: frame.
	self color: TButton normColor.
	frame solidVisibleTree: false.
	^self
