scheduling
removeLinkSuchThat: aBlock from: aList
	| newHead next prev |
	newHead := next := aList.
	prev := nil.
	[next == nil] whileFalse:[
		(aBlock value: next) 
			ifTrue:[next := next nextLink]
			ifFalse:[prev := next. next := nil]].
	newHead := prev ifNil:[^nil].
	next := prev nextLink.
	[next == nil] whileFalse:[
		(aBlock value: next) ifTrue:[
			prev nextLink: next nextLink.
			prev nextLink ifNotNil:[prev nextLink prevLink: prev].
			next := next nextLink.
		] ifFalse:[
			prev := next.
			next := next nextLink.
		].
	].
	^newHead