accessing
uvAngle

	material ifNotNil:[^ material uvAngle].
	texture ifNotNil:[^ texture uvAngle].
	^ 0.