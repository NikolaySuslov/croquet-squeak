constructing
add: aString target: anObject action: aSelector arguments: args
	| item |
	item := self addItem: aString.
	item action: (TMenuAction receiver: anObject selector: aSelector arguments: args).
	(anObject respondsTo: aSelector) ifFalse:[item enabled: false].
	^item