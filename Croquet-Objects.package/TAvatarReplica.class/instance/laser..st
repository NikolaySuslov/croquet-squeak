accessing
laser: las

	| carry |
	carry := TAvatarCarry new.
	carry addChild: las.
	self addChild: carry.
	las solidTree: false.
	