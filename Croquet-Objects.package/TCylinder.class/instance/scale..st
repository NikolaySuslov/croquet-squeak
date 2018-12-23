accessing
scale: scl

	self translation: (self translation * scl).
	baseRadius := baseRadius * scl.
	topRadius := topRadius * scl.
	height := height * scl.
	self boundsChanged.