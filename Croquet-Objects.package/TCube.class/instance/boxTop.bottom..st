accessing
boxTop: top bottom: bottom

	self extent: (top - bottom).
	self location: (bottom + top)/2.0.
	self boundsChanged.

