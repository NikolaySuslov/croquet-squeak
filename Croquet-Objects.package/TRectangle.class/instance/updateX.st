initialize
updateX

	| dx dy x y z vert texCoord newNorm deltax deltay fg strip |
	mode := GLTriangleStrip.

	dx := self extent x/2.0.
	dy := self extent y/2.0.
	deltax := self extent x/divisions x asFloat.
	deltay := self extent y/divisions y asFloat.

	x := location x.
	y := location y.
	z := location z.

	vert := Vector3 new.
	texCoord := Vector2 new.

	0 to: divisions y do:[ :yIndex |
		0 to: divisions x do:[ :xIndex |
			
			vert x: (xIndex*deltax-dx+x)
				y: (yIndex*deltay-dy+y)
				z: z.
			texCoord u: xIndex/divisions x asFloat v: divisions y - (yIndex/divisions y) asFloat.

			vertexBuffer at: divisions x + 1 * yIndex + xIndex + 1 put: vert.
			texCoordBuffer at: divisions x + 1 * yIndex + xIndex + 1 put: texCoord.
		].
	].

	fg := OrderedCollection new.
	flip 
		ifFalse:[
			newNorm := 0@0@1.
			0 to: divisions y-1 do:[ :yIndex |
				strip := OrderedCollection new.
				0 to: divisions x do:[ :xIndex |
					strip add:divisions x + 1 *(yIndex+1) + xIndex.
					strip add:divisions x + 1 * yIndex + xIndex.
				].
			fg add:1; add: strip asIntegerArray.
			]
		]
		ifTrue:[
			newNorm := 0@0@-1.
			0 to: divisions y-1 do:[ :yIndex |
				strip := OrderedCollection new.
				0 to: divisions x do:[ :xIndex |
					strip add:divisions x + 1 * yIndex + xIndex.
					strip add:divisions x + 1 *(yIndex+1) + xIndex.
				].
			fg add: 1; add: strip asIntegerArray.
			].
		].

	self faceGroups: fg.
	normalBuffer atAllPut: newNorm.

	"If 'norm' is nil, it is intentional... it means that the rectangle can be picked from both sides. Preserve this property."
	norm ifNotNil: [norm := newNorm].

	changed := false