accessing
add: anObject
	"Include anObject as one of the receiver's elements, but only if
	not already present. Answer farRef."
	| index |
	anObject ifNil: [self error: 'Sets cannot meaningfully contain nil as an element'].
	index := self findElementOrFlag: anObject.
	(array at: index) == flag ifTrue:[self atNewIndex: index put: anObject].
	^anObject