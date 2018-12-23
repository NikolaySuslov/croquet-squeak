constructing
add: aString target: anObject action: aSelector checked: aBool
	| item |
	item := self add: aString target: anObject action: aSelector.
	item checked: aBool.
	^item