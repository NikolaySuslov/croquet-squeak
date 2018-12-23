transform
yawTransform
	| v |
	v := localTransform row3.
	v x > 0 ifTrue:[self yaw: v z arcCos radiansToDegrees negated] ifFalse:
							[self yaw: v z arcCos radiansToDegrees.].