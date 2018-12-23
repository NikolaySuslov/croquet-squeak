accessing
asFarRef: anObject
	"Answer the far ref for the given (near) object"
	anObject isFarRef ifTrue:[^anObject].
	^exports at: anObject ifAbsentPut:[
		| ref |
		ref := TFarRef new.
		anObject myFarRef: ref.
		ref].