initialize
initializeWithSize: sz

	| nCell |
	size := sz.
	nCell := size x * size y.

	surface := FloatArray ofSize: nCell.
	force := FloatArray ofSize: nCell.
	velocity := FloatArray ofSize: nCell.
	fVert := FloatArray ofSize: nCell.
	fHorz := FloatArray ofSize: nCell.
	fDiag1 := FloatArray ofSize: nCell.
	fDiag2 := FloatArray ofSize: nCell.
	normals := Vector3Array ofSize: nCell.
	textureUV := Vector2Array ofSize: nCell.
	oneOverSqrtTwo := 1.0/(2.0 sqrt).
	
	matWater := TMaterial new.
	matWater ambientColor: #(0.8 0.9 0.9 0.9).
	matWater diffuseColor: #(0.8 0.9 0.9 0.9).

	aspectFixed := true.
	countDown := 0.
	nSteps := 0.0.
	^self
