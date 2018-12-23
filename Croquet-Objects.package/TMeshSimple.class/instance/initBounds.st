initialize
initBounds

	boundsDepth = 0 
		ifTrue:[boundSphere := TBoundSphere mtfBall: vertices. ]
		ifFalse:[
			boundSphere := TBoundSphere  calcTree: vertices 
											faces: faces
											depth: boundsDepth. 
		].
	boundSphere frame: self.
	boundsChanged := false.