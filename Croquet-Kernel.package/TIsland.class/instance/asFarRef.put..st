accessing
asFarRef: anObject put: farRef
	"Answer the far ref for the given (near) object"
	anObject isFarRef ifTrue:[^anObject].
	^exports at: anObject ifAbsentPut:[
		anObject myFarRef: farRef.
		farRef].