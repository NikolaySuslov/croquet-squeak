accessing
asFarRef: anObject
	"Answer the far ref for the given (near) object"
	anObject isFarRef ifTrue:[^anObject].
	^exports at: anObject ifAbsentPut:[
		| ref |
		ref := FarRef new.
		anObject myFarRef: ref.
		ref].