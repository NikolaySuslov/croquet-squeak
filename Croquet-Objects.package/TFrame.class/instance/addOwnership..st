ownership
addOwnership: frame

	frame = self ifTrue:[ ^self ]. "we don't add ourselves to the list"
	frame eventMask~=EventNone ifTrue:[ ^self ]. "don't add components"
	ownedObjects ifNil:[ ownedObjects := Dictionary new.].
	ownedObjects at: frame objectID put: frame.
	frame forceObjectOwner: self.
	frame frameChildrenDo:[:child | self addOwnership: child. ].
