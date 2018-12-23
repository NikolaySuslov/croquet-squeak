initialize
initBounds

	boundsDepth = 0 
		ifTrue:[boundSphere := TBoundSphere mtfBall: self vertices. ]
		ifFalse:[
			faceGroups size = 2 
				ifTrue:[	
					boundSphere := TBoundSphere 
											calcTree: self vertices 
											faces: (faceGroups at: 2) 
											depth: boundsDepth. ] 
				ifFalse:[
					boundSphere := TBoundSphere mtfBall: self vertices.
					1 to: faceGroups size by: 2 do:[ :i || child |
						child := TBoundSphere 
										calcTree: self vertices 
										faces: (faceGroups at: i+1) 
										depth: boundsDepth-1.
						boundSphere addChild: child.].
			].].
	boundSphere frame: self.
	boundsChanged := false.