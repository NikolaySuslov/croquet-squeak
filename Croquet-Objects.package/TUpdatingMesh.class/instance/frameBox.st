accessing
frameBox
	changed ifTrue: [self updateMesh].
	^ super frameBox.