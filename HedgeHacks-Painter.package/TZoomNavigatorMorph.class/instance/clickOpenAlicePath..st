alice items
clickOpenAlicePath: aPath
	targetHeight := nil.
	self addAliceLibrary: aPath.
	self mouseMove: ActiveHand lastEvent.