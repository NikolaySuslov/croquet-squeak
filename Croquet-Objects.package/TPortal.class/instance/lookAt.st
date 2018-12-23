accessing
lookAt

	| mat |
	mat := self globalTransform.
	^ Vector3 x:  mat a13 y: mat a23 z: mat a33.