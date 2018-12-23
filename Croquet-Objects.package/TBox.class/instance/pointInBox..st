comparing
pointInBox: v

	v x < minCorner x ifTrue:[^ false.].
	v x > maxCorner x ifTrue:[^ false.].
	v y < minCorner y ifTrue:[^ false.].
	v y > maxCorner y ifTrue:[^ false.].
	v z < minCorner z ifTrue:[^ false.].
	v z > maxCorner z ifTrue:[^ false. ].
	^ true.