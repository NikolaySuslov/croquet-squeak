accessing
computeVertexNormals
	| temp normals face normal v1 v2 v3 out |
	temp := Array new: vertices size.
	1 to: temp size do:[:i| temp at: i put: Vector4 new].
	normals := self computeFaceNormals.
	1 to: faces size do:[:i|
		face := faces at: i.
		normal := (normals at: i) asVector4.
		v1 := face at: 1.
		v2 := face at: 2.
		v3 := face at: 3.
		(temp at: v1) += normal.
		(temp at: v2) += normal.
		(temp at: v3) += normal.
	].
	out := Vector3Array new: vertices size.
	1 to: out size do:[:i|
		out at: i put: (temp at: i) asVector3 safelyNormalize.
	].
	^out