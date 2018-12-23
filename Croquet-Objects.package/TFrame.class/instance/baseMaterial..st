accessing
baseMaterial: mat
	frameChildren ifNil:[^self].
	frameChildren do:[:each| each material: mat].