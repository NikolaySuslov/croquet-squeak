accessing
reconstruct

"This method figures out how to reconstruct the mesh based solely upon the face information - material, vertex indices, vertex normals, and texture indices. It creates a group of sub-meshes which are then properly rendered. I realize that this could and should be broken down into many smaller methods, but I don't want to deal with creating throw-away classes that would only be used to help this method. On the other hand, I am very aware that there is a limit on the actual size of a method, so I might have to anyway."

	| faceNormals vertexFaceNormals vi ai ti mi vNorm fvi tvi avi mvi counter found faceGroup mm |

" First, make the face normals and vertex normals. "

	((self recalculateFaceNormals: (faces size)) or: [ meshFaceNormals = nil]) "not a really huge model or didn't get any normals in the ase file"
			 ifTrue:  [ faceNormals := self calcFaceNormals.]  "compute them"
			 ifFalse: [ Transcript show: 'Faces:', (faces size) asString, ' using file values for face normals'; cr. 
					  faceNormals := meshFaceNormals.
					  ].
	meshFaceNormals := nil. "Clear for next use."

	((self recalculateFaceVertexNormals: (faces size)) or: [ meshFaceVertexNormals = nil])  
			"if not a huge model or didn't get any normals in the ase file"
			ifTrue: [vertexFaceNormals := self calcVertexNormals: faceNormals.]
			ifFalse: [ Transcript show: 'Faces:', (faces size) asString, ' using file values for face vertex normals'; cr.
					vertexFaceNormals := meshFaceVertexNormals. 
					].
	meshFaceVertexNormals := nil.  "Clear for next use"

	tfaces ifNotNil:[self calcTextureVertices.].

"Faces now include the following information:
	- 1 Material index - matIndex
	- 3 Vertex indices - faces
	- 3 Vertex normals - vertexFaceNormals
	- 3 texture indices - tfaces
We build a new group of submeshes.
We first look at sub-groups according to materials. Then we compare vertices to build the final face tables.
A vertex is considered equal iff the index, normal, and texture index are identical. Otherwise, it must be aliased."

	vi := OrderedCollection ofSize: ((vertices size)).
	ai := OrderedCollection ofSize: ((vertices size)).
	ti := OrderedCollection ofSize: ((vertices size)).
	mi := OrderedCollection ofSize: ((vertices size)).
	vNorm := OrderedCollection ofSize: ((vertices size)).


1 to: faces size do:[ :i |
	found := false.
	fvi := 1+ (faces at: i).
	avi := fvi.
	tfaces ifNotNil:[tvi := 1 + (tfaces at: i).] 
		ifNil:[tvi := 1.].
	counter := 1+(i-1//3).
	mvi := matIndex at: counter.
	[found] whileFalse:[
		"Anything already in this slot?"
		(vi at: avi) ifNil:[
			vi at: avi put: fvi.
			ti at: avi put: tvi.
			vNorm at: avi put: (vertexFaceNormals at: i).
			mi at: avi put: mvi.
			found := true.
			].
		"Is what is there already the same as whet we have?"
		found ifFalse:[
			((vi at: avi) = fvi and:[
				(ti at: avi) = tvi and:[
					(mi at: avi) = mvi and:[
						self compare: (vNorm at: avi) 
							and: (vertexFaceNormals at: i) 
							within:0.0001.
							]
						]
					]) ifTrue:[
						faces at: i put: (avi-1).
						found := true.
						].
			].
		" There is something already there, but it is the wrong thing, we need an alias."
		found ifFalse:[
			(ai at: avi) 
				ifNil:[
					ai add: nil.
					vi add: fvi.
					ti add: tvi.
					vNorm add: (vertexFaceNormals at: i).
					mi add: mvi.
					ai at: avi put: vi size.
					faces at: i put: (vi size)-1.
					found := true.
					] 
				ifNotNil:[
					avi := ai at: avi.
					].
				].
			].
		].
"

The following commented out code fragment does the naive job of just adding all of the face information without looking for redundency. It is commented out because IT SHOULD NOT BE USED! It is here just for reference, because someday, someone will get totally lost in what is going on here and this is a quick and dirty way to simplify the problem. The results are wrong of course, but at least it is a start.
-------
1 to: faces size do:[ :i |						
	vi add: 1+ (faces at:i).
	tfaces ifNotNil:[ ti add: 1 +( tfaces at: i). ] ifNil:[ ti add: 1.].
	vNorm add: (vertexFaceNormals at: i).
	faces at: i put: i-1.].
-------"


"Now clean up the arrays and convert them. The arrays I need to construct here are:
	vertexArray - the actual 3D vertex array including aliases.
	aliasArray - the alias index array - this will be used for vector based animations
	vertexNorms - the vertex normals
	textureArray - the u,v texture coordinate array
which are all the same length, and
	faceGroup - the collection of all faceGroups - check the associated material for alphas.
	"

	vi := self vertexIndexToArray: vi.
	ai := self aliasIndexToArray: ai.
	vNorm := self vertNormToArray: vNorm.
	tfaces ifNotNil:[ti := self textureIndexToArray: ti.] ifNil:[ ti := nil.].

	faceGroup := self facesToFaceGroup: faces materials: matIndex.
	mm := TMesh triMeshWithVertices: vi alias: ai norms: vNorm textureUV: ti faceGroups: faceGroup material: (materialRef ifNotNil:[materialList at: 1+materialRef]).    
	mm localTransform: self localTransform.
	mm objectName: self objectName.
	^ mm.