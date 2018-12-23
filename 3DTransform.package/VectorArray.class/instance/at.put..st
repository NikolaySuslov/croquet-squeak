accessing
at: index put: anObject
	"Store the object at the given index in the receiver"
	| idx |
	idx := index - 1 * self contentsSize.
	self privateReplaceFrom: idx+1 to: idx + self contentsSize with: anObject startingAt: 1.
	^anObject