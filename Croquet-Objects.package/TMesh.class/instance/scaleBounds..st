accessing
scaleBounds: scale

	boundSphere ifNil: [self boundsChanged. ^ self].
	boundSphere scale: scale.
