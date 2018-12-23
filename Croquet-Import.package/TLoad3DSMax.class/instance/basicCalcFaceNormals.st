convert
basicCalcFaceNormals

"Calculate the normal for each primitive (simple vertex index) face."
	| v1 v2 v count faceNormals |

	faceNormals := Vector3Array  new: (faces size//3).
	count := 1.
	1 to: faceNormals size do:[   :i |
		v1 := (vertices at:(faces at: count)+1) - (vertices at: (faces at: count+1)+1).
		v2 := (vertices at:(faces at: count+1)+1) - (vertices at: (faces at: count+2)+1).
		v := v1 cross: v2.
		v length = 0.0 ifFalse:[ v:= v normalized.].
		faceNormals at: i put: v.
		count := count+3.].

	^ faceNormals.