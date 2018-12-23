copying
passByCopy: obj
	"Pass a copy of the given object"
	map ifNil:[map := IdentityDictionary new].
	^map at: obj ifAbsent:[self copy: obj].
