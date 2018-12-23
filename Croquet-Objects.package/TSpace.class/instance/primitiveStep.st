step
primitiveStep

	| bs |
	testRays ifTrue:[ 
		self doForPick:[:frame | 
			bs := frame boundSphere.
			frame isFrameChanged ifTrue:[
			bs ifNotNil:[
				bs transform: frame globalTransform.
				].
			].
			rayFrames do:[ :rf | rf automatic ifTrue:[rf pick: bs.].].
		].
	].	
	(self future:100)primitiveStep.