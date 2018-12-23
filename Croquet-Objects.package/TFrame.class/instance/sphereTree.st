accessing
sphereTree

	| bs |
	
	bs := self boundSphere.
	bs ifNotNil:[
		frameChildren ifNotNil:[ frameChildren do:[ :fc | bs := bs union: (fc sphereTree).].].
		^ bs.
		].
	frameChildren ifNotNil:[
		frameChildren do:[ :fc |
			bs ifNil:[ bs := fc sphereTree. ] 
				ifNotNil: [bs := bs union: (fc sphereTree). ].
		].
	^ bs.
	].
	^ nil.