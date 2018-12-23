as yet unclassified
step

	self addRotationAroundY: angle.
	angle := angle + 0.1.
	angle >= 360.0 ifTrue:[angle := 0.0].

	(self future: 500) step.