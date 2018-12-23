searching
countSegment
	| index hdrBits count |
	count := 0.
	index := 2.
	"go past extra header words"
	(hdrBits := (segment atPin: index) bitAnd: 3) = 1 ifTrue: [index := index+1].
	hdrBits = 0 ifTrue: [index := index+2].
	[count := count + 1.
	index := self objectAfter: index.
	index > segment size] whileFalse.
	^objCount := count