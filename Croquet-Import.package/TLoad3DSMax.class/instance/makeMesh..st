parse
makeMesh: tree

	| fieldName field numVertices numFaces numTVertex numTVFaces tarray count matCount tv field2 field3 iterations |

	tvertices := nil.
	tfaces := nil.
	meshFaceNormals := nil.
	meshFaceVertexNormals := nil.
	
	tree linksDo:[ :node |
		fieldName := node name.
		field := node value.
		
		fieldName = #TMeshNumvertex ifTrue:[ 
			numVertices := self makeNumber: field.
			vertices := Vector3Array new: numVertices. 
			]
		ifFalse:[
		fieldName = #TMeshNumfaces ifTrue:[
			numFaces := self makeNumber: field.
			faces := IntegerArray ofSize: (numFaces*3).
			matIndex := IntegerArray ofSize: numFaces.
			]
		ifFalse:[
		fieldName = #TMeshVertexList ifTrue:[ 
			field ifNotNil:[
				count := 1.
				field do:[ :node2 |
					field2 := node2 value.
					tarray := self makeNumberArray: (field2).
					"NOTE: swap of 3DS y and z coordinates and negation of 3ds y coordinate"
					tarray := (Vector3 x:(tarray at: 2) y: (tarray at: 4) z:(tarray at: 3)negated)*scale.
					vertices at: count put: tarray.
					count := count+1.
					].
				].
			]
		ifFalse:[
		fieldName = #TMeshFaceList ifTrue:[
			count := 1.
			matCount := 1.
			iterations := 1.
			field do:[ :node2 |
				iterations=1 ifTrue: [field2 := node2 value].
				iterations=3 ifTrue: [field3 := node2 value.
					tarray := self makeNumberArray: (field2).
					faces at: count  put: (tarray at: 2).
					faces at: count+1 put: (tarray at: 3).
					faces at: count+2 put: (tarray at: 4).
					count := count+3.
					matIndex at: matCount put:(self makeNumber: field3).
					matCount := matCount + 1.
					iterations := 0.
					].
				iterations := iterations + 1.			
				]
			]
		ifFalse:[
		fieldName = #TMeshNumtvertex ifTrue:[
			numTVertex := self makeNumber:field.
			tvertices := Vector2Array new: numTVertex. 
			]
		ifFalse:[
		fieldName = #TMeshTvertlist ifTrue:[
			count := 1.
			field do:[ :node2 |
				field2 := node2 value.
				tarray := self makeNumberArray: (field2).
				tv := (Vector2 x:(tarray at:2) y:1-(tarray at:3)).
				tvertices at: count put: tv.
				count := count+1.
				].
			]
		ifFalse:[
		fieldName = #TMeshNumtvfaces ifTrue:[
			numTVFaces := self makeNumber: field.
			tfaces := IntegerArray ofSize:(numTVFaces*3). 
			]
		ifFalse:[
		fieldName = #TMeshNormals ifTrue:[
			"if we are recalculating anyway don't bother to get the normals 
				35% of time is spent getting numbers out of the fields" 
			(self recalculateFaceNormals: numFaces) 
				ifFalse: [meshFaceNormals := self makeFaceNormals: field.].
			(self recalculateFaceVertexNormals: numFaces) 
				ifFalse: [meshFaceVertexNormals := self makeFaceVertexNormals: field.].
			]
		ifFalse:[

		fieldName = #TMeshTfacelist ifTrue:[
			count := 1.
			field do:[ :node2 |
				field2 := node2 value.
				tarray := self makeNumberArray: (field2).
				tfaces at: count put: (tarray at: 2).
				tfaces at: count+1 put: (tarray at: 3).
				tfaces at: count+2 put: (tarray at: 4).
				count := count+3.
				].
			].
		]]]]]]]]
		].
