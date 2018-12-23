accessing
texCoords
	changed ifTrue: [self updateMesh.].
	^ super texCoords.