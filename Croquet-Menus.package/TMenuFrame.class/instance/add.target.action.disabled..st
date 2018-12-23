constructing
add: aString target: anObject action: aSelector disabled: aBool
	| item |
	item := self add: aString target: anObject action: aSelector.
	item disabled: aBool.
	^item