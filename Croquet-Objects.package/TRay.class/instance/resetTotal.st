accessing
resetTotal
	lastSelection := self newSelection.
	selection := self newSelection.
	selection distance: Float infinity.
	self maxDistance: Float infinity.
	self minDistance: 0.0.
