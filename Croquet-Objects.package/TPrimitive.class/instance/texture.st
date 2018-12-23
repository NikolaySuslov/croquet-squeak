accessing
texture

	^ texture ifNil:[material ifNotNil:[material texture]].