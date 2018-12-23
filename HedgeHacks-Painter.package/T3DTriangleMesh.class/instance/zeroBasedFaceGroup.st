accessing
zeroBasedFaceGroup
	"Answer the faces using zero-based references."
	| myFaces index |
	myFaces := IntegerArray new: faces size * 3.
	index := 0.
	faces do:[:f|
		myFaces at: (index := index + 1) put: (f at: 1) - 1.
		myFaces at: (index := index + 1) put: (f at: 2) - 1.
		myFaces at: (index := index + 1) put: (f at: 3) - 1.
	].
	^myFaces