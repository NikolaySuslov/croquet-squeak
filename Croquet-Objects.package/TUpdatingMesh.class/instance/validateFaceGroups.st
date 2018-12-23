initialize
validateFaceGroups
	changed ifTrue: [self updateMesh].
	super validateFaceGroups.