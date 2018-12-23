private
privateInstallLibrary: glLibraryName
	"Do a bit of reflective hacking so that we don't have to carry around lots and lots of duplicate methods for the OpenGL API on each platform. The only 'real' difference is the name of the appropriate shared library here. Indeed, we could (nay... we SHOULD) have done this through a subclass of ExternalLibrary which handles this for us but since we haven't, get out the reflective hammer and nail down the problem."
	| lit |
	InstalledOpenGLLibrary = glLibraryName ifTrue:[^self].
	OpenGL methodsDo:[:meth|
		lit := meth numLiterals > 0 ifTrue:[meth literalAt: 1].
		lit class == ExternalLibraryFunction ifTrue:[lit setModule: glLibraryName].
	].
	InstalledOpenGLLibrary := glLibraryName.