accessing
uvOffset

	material ifNotNil:[^ material uvOffset].
	texture ifNotNil:[^ texture uvOffset].
	^ 0@0.