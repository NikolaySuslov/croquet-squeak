compiling
addSelector: aSelector withMethod: aMethod
	"Flush the installed OGL library to force relinking"
	InstalledOpenGLLibrary := nil.
	^super addSelector: aSelector withMethod: aMethod