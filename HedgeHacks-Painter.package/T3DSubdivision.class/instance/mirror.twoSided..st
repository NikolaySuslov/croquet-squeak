private
mirror: half twoSided: twoSided
	"Mirror one half-mesh and return a full mesh"
	| vtx nrm tex faces faceOffset vtxOffset mesh f |
	vtx := Vector3Array new: half vertices size * 2.
	nrm := Vector3Array new: half vertexNormals size * 2.
	tex := Vector2Array new: half texCoords size * 2.
	faces := Array new: (half faces size * 2).
	"Fill in first half"
	vtx 
		privateReplaceFrom: 1 
		to: half vertices basicSize 
		with: half vertices 
		startingAt: 1.
	nrm 
		privateReplaceFrom: 1 
		to: half vertexNormals basicSize 
		with: half vertexNormals 
		startingAt: 1.
	tex 
		privateReplaceFrom: 1 
		to: half texCoords basicSize 
		with: half texCoords 
		startingAt: 1.
	faces 
		replaceFrom: 1 
		to: half faces size 
		with: half faces 
		startingAt: 1.

	"fill in second half"
	half flipZ.
	twoSided ifTrue:[
		half texCoords do:[:tx| tx v: (1.0 - tx v)].
	].
	vtx 
		privateReplaceFrom: half vertices basicSize + 1 
		to: vtx basicSize 
		with: half vertices 
		startingAt: 1.
	nrm 
		privateReplaceFrom: half vertexNormals basicSize + 1 
		to: nrm basicSize 
		with: half vertexNormals 
		startingAt: 1.
	tex 
		privateReplaceFrom: half texCoords basicSize + 1 
		to: tex basicSize 
		with: half texCoords 
		startingAt: 1.

	faceOffset := half faces size.
	vtxOffset := half vertices size.
	1 to: half faces size do:[:i|
		f := half faces at: i.
		faces at: i+faceOffset put: (Array
			with: (f at: 3) + vtxOffset
			with: (f at: 2) + vtxOffset
			with: (f at: 1) + vtxOffset
		).
	].
	mesh := T3DTriangleMesh new.
	mesh vertices: vtx.
	mesh vertexNormals: nrm.
	mesh faces: faces.
	mesh texCoords: tex.
	^mesh