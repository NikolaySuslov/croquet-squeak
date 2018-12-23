accessing
glExtGetProcAddress: aString
	"Answer the function address for the given extension function"
	<apicall: ulong 'wglGetProcAddress' (char*) module: 'opengl32.dll'>
	^self externalCallFailed