accessing
boundSphere
	changed ifTrue: [self updateMesh].
	^ super boundSphere.