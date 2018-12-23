accessing
testSelectedDistanceSquared: dist

	| scaledDistance |
	testDistance ifFalse:[ ^ true. "don't test, just say yes."].
	scaledDistance := frameScaleSquared * dist.
	selection distanceSquared < scaledDistance ifTrue:[^ false ]. "we already have a closer point."
	minDistanceSquared > scaledDistance ifTrue:[^ false]. "this choice is too close "
	maxDistanceSquared < scaledDistance ifTrue:[^ false]. "this choice is too far "
	^ true.