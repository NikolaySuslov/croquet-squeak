initialize
initialize
	super initialize.
	self resetTotal.
	self doSelect: true.
	self testDistance: true.
	self visible: false.
	self downRay: false.
	self setAutomatic: true.
	frameScale := 1.
	frameScaleSquared := 1.
	excludeFrame := nil.

	^self
