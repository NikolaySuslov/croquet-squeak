action
enable

	self color: TButton overColor.
	switch ifNil:[ frame solidVisibleTree: true. ] ifNotNil:[
		frame solidVisibleTree: switch not.
		frame2 solidVisibleTree: switch.
		].
	animateTime := nil.
	persist ifFalse:[self startStepping].