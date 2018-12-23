accessing
material: mat
	frameChildren ifNil:[^self].
	frameChildren do:[:each| each material: mat].