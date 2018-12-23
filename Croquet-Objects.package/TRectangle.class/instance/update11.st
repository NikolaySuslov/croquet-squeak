initialize
update11

	| dx dy x y z vert texCoord newNorm |
	mode := GLQuads.

	vertexBuffer := Vector3Array ofSize: 4.
	normalBuffer := Vector3Array ofSize: 4.
	texCoordBuffer := Vector2Array ofSize: 4.

	dx := self extent x/2.0.
	dy := self extent y/2.0.
	x := location x.
	y := location y.
	z := location z.

	vert := Vector3 new.
	texCoord := Vector2 new.

	vert x: x-dx y: y+dy z: z.
	texCoord u: 0.0 v: 0.0.
	vertexBuffer at: 1 put: vert.
	texCoordBuffer at: 1 put: texCoord.

	vert x: x-dx y: y-dy z: z.
	texCoord u: 0.0 v: 1.0.
	vertexBuffer at: 2 put: vert.
	texCoordBuffer at: 2 put: texCoord.

	vert x: x+dx y: y-dy z: z.
	texCoord u: 1.0 v: 1.0.
	vertexBuffer at: 3 put: vert.
	texCoordBuffer at: 3 put: texCoord.

	vert x: x+dx y: y+dy z: z.
	texCoord u: 1.0 v: 0.
	vertexBuffer at: 4 put: vert.
	texCoordBuffer at: 4 put: texCoord.

	flip 
		ifFalse:
			[newNorm := 0@0@1.
			self faceGroups: {1. #(0 1 2 3) asIntegerArray}]
		ifTrue:
			[newNorm := 0@0@-1.
			self faceGroups: {1. #(3 2 1 0) asIntegerArray}].
	normalBuffer atAllPut: newNorm.

	"If 'norm' is nil, it is intentional... it means that the rectangle can be picked from both sides. Preserve this property."
	norm ifNotNil: [norm := newNorm].

	changed := false