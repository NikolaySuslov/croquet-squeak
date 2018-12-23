initialize
initializeWithSpace: space frame: frame

	space addChild: self.
	self addChild: frame.
	frameChildren do:[ :fc | fc frameChanged.].
	self reinstall.