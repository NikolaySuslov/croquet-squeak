accessing
faceGroupsDo: aBlock
	changed ifTrue: [self updateMesh].
	super faceGroupsDo: aBlock
