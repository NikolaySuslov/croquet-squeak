scheduling
removeLinksWithValue: value from: aList
	"Remove all links with the given value from aList. 
	Return the new head of the list"
	| newHead next prev |
	newHead := next := aList.
	prev := nil.
	[next == nil] whileFalse:[
		(next value == value) 
			ifTrue:[next := next nextLink]
			ifFalse:[prev := next. next := nil]].
	newHead := prev ifNil:[^nil].
	next := prev nextLink.
	[next == nil] whileFalse:[
		(next value == value) ifTrue:[
			prev nextLink: next nextLink.
			prev nextLink ifNotNil:[prev nextLink prevLink: prev].
			next := next nextLink.
		] ifFalse:[
			prev := next.
			next := next nextLink.
		].
	].
	^newHead