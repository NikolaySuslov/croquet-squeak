render
pick: pointer

	"This makes pick: less dependent on the rendering activity. 
	 It's a patch until the TPrimitive changed/update/render legacy is repaired."
	changed
		ifTrue: [self update].

	(pointer pickTriangle: (normals at: 1) 
		tri: (vertices at: 3) 
		tri: (vertices at: 2)
		tri: (vertices at: 1)) ifTrue:[ ^ true. ].

	(pointer pickTriangle: (normals at: 2) 
		tri: (vertices at: 4) 
		tri: (vertices at: 3)
		tri: (vertices at: 1)) ifTrue:[ ^ true. ].

	(pointer pickTriangle: (normals at: 3) 
		tri: (vertices at: 2) 
		tri: (vertices at: 4)
		tri: (vertices at: 1)) ifTrue:[ ^ true ].

	(pointer pickTriangle: (normals at: 4) 
		tri: (vertices at: 2) 
		tri: (vertices at: 3)
		tri: (vertices at: 4)) ifTrue:[ ^ true. ].

	^ false.