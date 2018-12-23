accessing
rotationAroundY: anAngle
	| rad s c |
	rad := anAngle degreesToRadians.
	s := rad sin.
	c := rad cos.
	self a11: c.
	self a13: s.
	self a33: c.
	self a31: s negated.
	^self