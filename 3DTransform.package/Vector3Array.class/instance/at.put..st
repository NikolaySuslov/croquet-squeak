accessing
at: index put: anObject
	"Store the object at the given index in the receiver"
	| idx |
	idx := index - 1 * 3.
	self privateReplaceFrom: idx+1 to: idx + 3 with: anObject startingAt: 1.
	^anObject