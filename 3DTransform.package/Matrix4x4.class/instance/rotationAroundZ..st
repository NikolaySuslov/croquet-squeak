accessing
rotationAroundZ: anAngle
	| rad s c |
	rad := anAngle degreesToRadians.
	s := rad sin.
	c := rad cos.
	self a11: c.
	self a12: s negated.
	self a22: c.
	self a21: s.
	^self