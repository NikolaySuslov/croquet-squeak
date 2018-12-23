initialize
initializeWithContents: conts

	| extent |
	contents := conts.
	box := self getBox: contents.
	self intoBox.
	extent := box extent.
	box min: (extent/-2.0).
	box max: (extent/2.0).
	self addChild: conts.
	scaleContents := 1.0.
	selectedAction := nil.
	changed := true.
	self updateBox.
