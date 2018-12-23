render
boundSphere

	boundsChanged ifTrue:[
		self initBounds. 
		boundsChanged := false.
		].
	^ boundSphere.