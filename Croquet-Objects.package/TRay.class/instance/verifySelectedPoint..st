accessing
verifySelectedPoint: sp

	((framePosition - sp) dot: framePointer row3)< 0.0 ifTrue:[^ false].
	selection point: sp.
	^ true.