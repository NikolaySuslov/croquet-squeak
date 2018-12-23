initialize
updateMesh

	| dx dy dz x y z tempVertices groups |

	mode := GLQuads.
	vertexBuffer := Vector3Array ofSize: 24.
	normalBuffer := Vector3Array ofSize: 24.
	texCoordBuffer := Vector2Array ofSize: 24.
	
	dx := extent x/2.0.
	dy := extent y/2.0.
	dz := extent z/2.0.
	x := location x.
	y := location y.
	z := location z.

	tempVertices := Vector3Array new: 8.
	tempVertices at: 1 put: (Vector3 x: x+(dx negated) y: y+(dy negated) z: z+dz).
	tempVertices at: 2 put: (Vector3 x: x+dx y: y+(dy negated) z: z+dz).
	tempVertices at: 3 put: (Vector3 x: x+dx y: y+ dy z: z+dz).
	tempVertices at: 4 put: (Vector3 x: x+(dx negated) y: y+dy z: z+dz).

	dz := dz negated.

	tempVertices at: 5 put: (Vector3 x: x+(dx negated) y: y+(dy negated) z: z+dz).
	tempVertices at: 6 put: (Vector3 x: x+dx y: y+(dy negated) z: z+dz).
	tempVertices at: 7 put: (Vector3 x: x+dx y: y+ dy z: z+dz).
	tempVertices at: 8 put: (Vector3 x: x+(dx negated) y: y+dy z: z+dz).

	groups := #((1 2 3 4) (8 7 6 5) (2 6 7 3) (1 4 8 5) (4 3 7 8) (1 5 6 2)).
	groups withIndexDo: [:gr :i | 
		1 to: 4 do: [:j | vertexBuffer at: (i-1)*4+j put: (tempVertices at: (gr at: j))]].

	#((0 0 1) (0 0 -1) (1 0 0) (-1 0 0) (0 1 0) (0 -1 0)) withIndexDo:[ :norm :i |
		1 to: 4 do: [:j | normalBuffer at:(i-1)*4+j put: (Vector3 from: norm).].].

	1 to: 6 do:[ :i |
		#((0 0) (0 1.0) (1.0 1.0) (1.0 0)) withIndexDo:[ :norm :j | 
			texCoordBuffer at: (i-1)*4+j put: (Vector2 from: norm).
		].
	].
	self faceGroups:{1. #(0 1 2 3  4 5 6 7  8 9 10 11  12 13 14 15  16 17 18 19  20 21 22 23) asIntegerArray}.
	changed := false
	

