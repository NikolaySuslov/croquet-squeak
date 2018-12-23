accessing
add: farRef
	"Include farRef as one of the receiver's elements, but only if
	not already present. Answer farRef."

	farRef ifNil: [self error: 'Sets cannot meaningfully contain nil as an element'].
	mutex critical: [| index |
		index := self findElementOrFlag: (farRef valueOn: island).
		(array at: index) == flag ifTrue:[self atNewIndex: index put: farRef].
		].
	^farRef