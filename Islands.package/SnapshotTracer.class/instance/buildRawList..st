searching
buildRawList: goal
	| list obj |
	list := OrderedCollection new.
	obj := goal.
	[list addFirst: obj.
	obj := parents at: obj ifAbsent:[nil].
	obj == nil] whileFalse.
	^list