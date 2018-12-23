searching
objectAfter: ind
	"Return the object or free chunk immediately following the given object or free chunk in the segment.  *** Warning: When class ObjectMemory change, be sure to change it here. ***"

	| sz word newInd hdrBits |
	sz := ((word := segment at: ind "header") bitAnd: 3) = 2   "free block?"
		ifTrue: [word bitAnd: 16rFFFFFFFC]
		ifFalse: [(word bitAnd: 3) = 0 "HeaderTypeSizeAndClass"
			ifTrue: [(segment at: ind-2) bitAnd: 16rFFFFFFFC]
			ifFalse: [word bitAnd: "SizeMask" 252]].

	newInd := ind + (sz>>2).
	"adjust past extra header words"
	(hdrBits := (segment atPin: newInd) bitAnd: 3) = 3 ifTrue: [^ newInd].
		"If at end, header word will be garbage.  This is OK"
	hdrBits = 1 ifTrue: [^ newInd+1].
	hdrBits = 0 ifTrue: [^ newInd+2].
	^ newInd	"free"