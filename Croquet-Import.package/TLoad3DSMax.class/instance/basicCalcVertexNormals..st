convert
basicCalcVertexNormals: faceNormals

"Calculate the normal for each face vertex."
	| vertexNormals vertexCount iCount faceIndex1 faceIndex2 fv1 fv2 edges index1 |
"Initialize the vertexNormals with the owning face normal."
	vertexNormals := Vector3Array  new: (faces size).
	vertexCount := IntegerArray new: (faces size).
	iCount := 1.
	1 to: faces size by: 3 do:[ :i |
		vertexNormals at: i put: (faceNormals at: iCount).
		vertexNormals at: i+1 put: (faceNormals at: iCount).
		vertexNormals at: i+2 put: (faceNormals at: iCount).
		iCount := iCount+1.].
"vertexCount is set to zero at the moment. It should be 1, but we know that it is always 1 greater than whatever our end result will be below."
	"self halt."

	1 to: faces size do:[:i |
		i+1 to: faces size do:[:j |
			(faces at: i) = (faces at: j) ifTrue:[
				faceIndex1 := 1 + ((i-1)//3).
				faceIndex2 := 1 + ((j-1)//3).
				(self testNorm: (faceNormals at: faceIndex1) norm: (faceNormals at: faceIndex2))
					ifTrue:[
						vertexNormals at: i put: ((vertexNormals at: i) + (faceNormals at: faceIndex2)).
						vertexCount at: i put: 1+ (vertexCount at: i).
						vertexNormals at: j put: ((vertexNormals at: j) + (faceNormals at: faceIndex1)).
						vertexCount at: j put: 1+ ( vertexCount at: j).
						].
				].
			].
		].
false ifTrue:[
"Build an edge dictionary"
	edges := Dictionary new.
	1 to: faces size by: 3 do:[ :i |
		edges at: (faces at:i)@(faces at:i+1) put: i@(i+1).
		edges at: (faces at: i+1)@(faces at: i+2) put: (i+1)@(i+2).
		edges at: (faces at: i+2)@(faces at: i) put: (i+2)@i].

"Now match edges"
	faceIndex2 := 1.
	1 to: faces size by: 3 do:[ :i |
		index1 := edges at: ((faces at:i+1)@(faces at:i)) ifAbsent:[ nil ].
		index1 ifNotNil:[ fv1 := i+1. fv2 := i.] ifNil:[
			index1 := edges at: ((faces at: i+2)@(faces at: i+1)) ifAbsent:[ nil. ].
			index1 ifNotNil:[ fv1 := i+2. fv2 := i+1.] ifNil:[
				index1 := edges at: ((faces at: i)@ (faces at: i+2)) ifAbsent:[ nil. ].
				index1 ifNotNil:[fv1 := i. fv2 := i+2.].
			].].

		index1 ifNotNil:[
			faceIndex1 := 1+((index1 x-1)//3).
			(self testNorm: (faceNormals at: faceIndex1) norm:(faceNormals at: faceIndex2))
				ifTrue:[
					vertexNormals at: fv1 put: ((vertexNormals at: fv1) + (faceNormals at: faceIndex1)).
					vertexNormals at: fv2 put: ((vertexNormals at: fv2) + (faceNormals at: faceIndex1)).
					vertexCount at: fv1 put: 1+(vertexCount at: fv1).
					vertexCount at: fv2 put: 1+(vertexCount at: fv2).
					fv1 := index1 x.
					fv2 := index1 y.
					vertexNormals at: fv1 put: ((vertexNormals at: fv1) + (faceNormals at: faceIndex2)).
					vertexNormals at: fv2 put: ((vertexNormals at: fv2) + (faceNormals at: faceIndex2)).].
					vertexCount at: fv1 put: 1+(vertexCount at: fv1).
					vertexCount at: fv2 put: 1+(vertexCount at: fv2).
				].						
		faceIndex2 := faceIndex2 + 1.
		].
].
" Calculate the average normal and normalize."
	1 to: vertexNormals size do:[ :i |
		(vertexNormals at: i) length = 0.0 ifFalse:[
		vertexNormals at:i put: ((vertexNormals at: i)/(1.0 + (vertexCount at: i)))normalized.].].

	^ vertexNormals.