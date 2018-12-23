accessing
scale: scale

	super scale: scale.
	changed ifTrue: [self updateMesh].
