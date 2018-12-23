accessing
testSelectedDistance: dist
 
	| scaledDistance |
	testDistance ifFalse:[ ^ 0. "don't test, just say yes."].
	dist < 0  ifTrue:[^ -1.].
	scaledDistance := dist * frameScale.
	selection distance < scaledDistance ifTrue:[^ 1 ]. "we already have a closer point."
	minDistance > scaledDistance ifTrue:[^ -1.]. "this is too close"
	maxDistance < scaledDistance ifTrue:[^ 1.]. "this is too far"
	^ 0.