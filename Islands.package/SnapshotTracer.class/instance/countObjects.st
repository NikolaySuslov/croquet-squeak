searching
countObjects
	| object count |
	count := 0.
	object := self someObject.
	[lastObject == object] whileFalse: [
		count := count + 1.
		object := object nextObject.
	].
	^objCount := count