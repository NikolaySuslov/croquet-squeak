back button
clickBackTo: morphs
	scroller removeAllMorphs.
	morphs do:[:each| self addItem: each].
	targetHeight := nil.
	self mouseMove: ActiveHand lastEvent.