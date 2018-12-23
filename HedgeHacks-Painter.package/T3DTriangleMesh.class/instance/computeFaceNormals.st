accessing
computeFaceNormals
	| out face v1 v2 v3 d1 d2 normal |
	out := Vector3Array new: faces size.
	1 to: faces size do:[:i|
		face := faces at: i.
		v1 := vertices at: (face at: 1).
		v2 := vertices at: (face at: 2).
		v3 := vertices at: (face at: 3).
		d1 := v3 - v1.
		d2 := v2 - v1.
		d1 safelyNormalize.
		d2 safelyNormalize.
		normal := d1 cross: d2.
		out at: i put: normal safelyNormalize.
	].
	^out