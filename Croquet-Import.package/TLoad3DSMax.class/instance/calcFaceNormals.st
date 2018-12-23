convert
calcFaceNormals

"Calculate the normal for each primitive (simple vertex index) face."
	| faceNormals count v1 v2 v midVertex |

	faceNormals := Vector3Array  new: (faces size//3).
	(self primCalcFaceNormals: vertices faces: faces faceNormals: faceNormals) 
		ifNotNil:[^faceNormals].

	count := 1.
	1 to: faceNormals size do:[ :i |
		
		midVertex := (vertices at: (faces at: count+1)+1).  "performance"
		v1 := (vertices at:(faces at: count)+1) - midVertex.
		v2 := midVertex - (vertices at: (faces at: count+2)+1).
		v := v1 cross: v2.
		v length = 0.0 ifFalse:[ v := v normalized.].
		faceNormals at: i put: v.
		count := count+3.
		].

	^ faceNormals.