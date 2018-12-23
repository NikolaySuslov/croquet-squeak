accessing
glExtGetProcAddress: aString
	"Answer the function address for the given extension function"
	<cdecl: ulong 'glXGetProcAddressARB' (char*) module: 'GL'>
	^self externalCallFailed