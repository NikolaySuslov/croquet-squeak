accessing
scale: scl
	extent := extent * scl.
	self translation: scl * self translation.
	self boundsChanged.
