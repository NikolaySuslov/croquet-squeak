private
doSpaceAnalysis
	"Capture statistics about the IS and print the number of instances per class and space usage"
	| index sz word hdrBits cc instCount instSpace |
	instCount := IdentityDictionary new.
	instSpace := IdentityDictionary new.
	index := 2. 	"skip version word, first object"
	"go past extra header words"
	hdrBits := (segment at: index) bitAnd: 3.
	hdrBits = 1 ifTrue: [index := index+1].
	hdrBits = 0 ifTrue: [index := index+2].
	[index > segment size] whileFalse:[
		hdrBits := (word := segment at: index) bitAnd: 3.
		hdrBits = 2 ifTrue:[sz := word bitAnd: 16rFFFFFFFC].
		hdrBits = 0 ifTrue:[sz := ((segment at: index-2) bitAnd: 16rFFFFFFFC) + 8].
		hdrBits = 1 ifTrue:[sz := (word bitAnd: "SizeMask" 252) + 4].
		hdrBits = 3 ifTrue:[sz := word bitAnd: "SizeMask" 252].

		"Figure out class name"
		hdrBits = 2 ifTrue:[
			cc := #freeChunk.
		] ifFalse:[ | ccIndex |

			((word := segment at: index) bitAnd: 3) = 2 
				ifTrue: [ccIndex := 0]
				ifFalse:[ccIndex := (word >> 12) bitAnd: 16r1F]."Compact Class field of header word"

			ccIndex = 0 ifTrue:[
				ccIndex := segment at: index-1.
				(ccIndex bitAnd: 16r80000000) = 0 ifTrue:[
					cc := #UserObject.
				] ifFalse:[
					ccIndex := (ccIndex bitAnd: 16r7FFFFFFF) bitShift: -2.
					cc := (imports at: ccIndex) name.
				].
			] ifFalse:[
				cc := (Smalltalk compactClassesArray at: ccIndex) name.
			].
		].
false ifTrue:[
	Transcript cr; nextPutAll: cc; space; print: sz; flush.
].
		instCount at: cc put: (instCount at: cc ifAbsent:[0]) + 1.
		instSpace at: cc put: (instSpace at: cc ifAbsent:[0]) + sz.

		"objectAfter:"
		sz := ((word := segment at: index "header") bitAnd: 3) = 2   "free block?"
			ifTrue: [word bitAnd: 16rFFFFFFFC]
			ifFalse: [(word bitAnd: 3) = 0 "HeaderTypeSizeAndClass"
				ifTrue: [(segment at: index-2) bitAnd: 16rFFFFFFFC]
				ifFalse: [word bitAnd: "SizeMask" 252]].
		index := index + (sz>>2).
		"adjust past extra header words"
		(hdrBits := (segment atPin: index) bitAnd: 3) = 3 ifFalse:[
			"If at end, header word will be garbage.  This is OK"
			hdrBits = 1 ifTrue: [index := index+1].
			hdrBits = 0 ifTrue: [index := index+2].
		].
	].
	^{instCount. instSpace}