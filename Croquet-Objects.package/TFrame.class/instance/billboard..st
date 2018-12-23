transform
billboard: cam

	| mat pos out target dir sin angle |
	mat := self globalTransform.
	pos := mat a14 @ mat a34.
	out := (mat a13 @ mat a33) normalized.
	mat := cam globalTransform.
	target := mat a14 @ mat a34.
	dir := (target - pos) normalized.
	sin := dir crossProduct: out.
	angle := ((dir dotProduct: out)*0.9999999) arcCos radiansToDegrees.
	mat := Matrix4x4 identity.
	mat rotationAroundY: angle * sin sign.
	localTransform := localTransform composedWithLocal: mat.	
	globalTransform := globalTransform composedWithLocal: mat.
