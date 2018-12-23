private
surface
	"Return the mesh representing the surface of the subdivision"
	| firstPoly poly faces half texScale |
	self markExteriorEdges.
	firstPoly := self triangulate.
	faces := WriteStream on: #().
	poly := firstPoly.
	[poly == nil] whileFalse:[
		faces nextPut: (T3DSimpleFace 
			with: (T3DSimpleVertex new position: poly v1@0) 
			with: (T3DSimpleVertex new position: poly v2@0)
			with: (T3DSimpleVertex new position: poly v3@0)).
		poly := poly next].
	faces := faces contents.
	faces isEmpty ifTrue:[^nil].
	half := T3DSimpleMesh withAll: faces contents.
	texScale := 1.0 / (area width max: area height).
	texScale := (1.0 / area width) @ (1.0 / area height).
	half do:[:face| face do:[:v|
		v texCoord: (v position x @ v position y) - area origin * texScale]].
	half := half asIndexedMesh.
	half vertexNormals: (half computeVertexNormals collect:[:v| v negated]).
	^half