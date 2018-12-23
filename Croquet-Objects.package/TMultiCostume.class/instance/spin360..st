accessing
spin360: angle

	angle <= 0 ifTrue:[^self].
	self addRotationAroundY:5.
	(self future:100)spin360:angle-5.