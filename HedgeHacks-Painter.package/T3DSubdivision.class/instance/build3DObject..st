private
build3DObject: twoSided
	"Return the full triangulation of the receiver"
	| firstPoly poly faces mesh half vtx nrm texScale |
	self markExteriorEdges.
	firstPoly := self triangulate.
	faces := WriteStream on: #().
	poly := firstPoly.
	[poly == nil] whileFalse:[
		faces nextPutAll: (poly elevateSpine: 2).
		poly := poly next].
	faces := faces contents.
	faces isEmpty ifTrue:[^nil].
	half := T3DSimpleMesh withAll: faces contents.
	texScale := 1.0 / (area width max: area height).
	twoSided 
		ifTrue:[texScale := texScale @ (0.5 * texScale)]
		ifFalse:[texScale := (1.0 / area width) @ (1.0 / area height)].
	half faces do:[:face| face vertices do:[:v|
		v texCoord: (v position x @ v position y) - area origin * texScale]].
	half := half asIndexedMesh.
	half vertexNormals: (half computeVertexNormals collect:[:v| v negated]).
	vtx := half vertices.
	nrm := half vertexNormals.
	1 to: vtx size do:[:i|
		(vtx at: i) z = 0.0 ifTrue:[nrm at: i put: ((nrm at: i) z: 0.0)]].
	mesh := self mirror: half twoSided: twoSided.
	^mesh