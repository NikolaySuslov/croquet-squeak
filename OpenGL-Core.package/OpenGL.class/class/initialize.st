class initialization
initialize
	"OpenGL initialize"
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self.
