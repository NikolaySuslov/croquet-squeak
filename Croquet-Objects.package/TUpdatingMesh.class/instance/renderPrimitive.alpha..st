accessing
renderPrimitive: ogl alpha: alphaPass
	changed ifTrue: [self updateMesh].
	super renderPrimitive: ogl alpha: alphaPass