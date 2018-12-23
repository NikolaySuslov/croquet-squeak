accessing
glExtGetProcAddress: aString
	"AGL does not support dynamic lookup of extension functions. We lookup in glExtModule instead"
	^nil