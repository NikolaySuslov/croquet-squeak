*Croquet-Import
addLastLink: aLink
	"Add aLink to the end of the receiver's list. Answer aLink."
	self isEmpty
		ifTrue: [firstLink := aLink]
		ifFalse: [lastLink nextLink: aLink].
	lastLink := aLink.
	^aLink