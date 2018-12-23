accessing
flipFace
	
	frontFace = GLCcw ifTrue:[frontFace := GLCw] ifFalse:[frontFace:= GLCcw].
	self setCull.