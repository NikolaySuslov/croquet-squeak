OpenGL API
glBegin: mode

	inGLBlock := true.
	forceWire ifTrue:[
		self realglBegin: GLLineStrip.]
	ifFalse:[
		self realglBegin: mode.].