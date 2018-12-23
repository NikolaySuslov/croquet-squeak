initialize
initializeSwitchWithFrame: fr frame2: fr2

	frame := fr.
	frame2 := fr2.
	self addChild: frame.
	self addChild: frame2.
	self color: TButton normColor.
	frame solidVisibleTree: false.
	frame2 solidVisibleTree: false.
	switch := false.
	^self
