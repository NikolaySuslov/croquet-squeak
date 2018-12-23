initialize
initBounds

	| location radius h2 |
	h2 := height/2.0.
	h2 := h2*h2.
	baseRadius < topRadius ifTrue:[radius := topRadius*topRadius.] 
							ifFalse:[radius := baseRadius * baseRadius.].
	radius := (radius+h2) sqrt.
	location := Vector3 x:0.0 y: height/2.0 z:0.0.
	boundSphere := TBoundSphere localPosition: location radius: radius.
	boundSphere frame: self.

