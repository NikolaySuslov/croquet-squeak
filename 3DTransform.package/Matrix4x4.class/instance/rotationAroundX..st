accessing
rotationAroundX: anAngle
	| rad s c |
	rad := anAngle degreesToRadians.
	s := rad sin.
	c := rad cos.
	self a22: c.
	self a23: s negated.
	self a33: c.
	self a32: s.
	^self