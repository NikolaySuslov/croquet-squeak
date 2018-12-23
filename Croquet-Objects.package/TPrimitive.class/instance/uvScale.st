accessing
uvScale
	texture ifNotNil:[^ texture uvScale].
	material ifNotNil:[^ material uvScale].
	^ 1.0@1.0.