initialize
material: mat
	mat ifNil:[^self].
	super material: mat.
	frameChildren do:[ :fc | fc color: mat ambientColor copy.].