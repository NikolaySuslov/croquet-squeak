accessing
fogOn:bool

	(fogOn:= bool) ifTrue:[ self glEnable: GLFog.]
	ifFalse:[self glDisable: GLFog.].