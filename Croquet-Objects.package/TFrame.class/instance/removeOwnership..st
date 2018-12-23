ownership
removeOwnership: frame

	frame = self ifTrue:[ ^self ]. "we did not add ourselves to the dictionary"
	frame objectOwner ~= self ifTrue:[ ^self ]. "this frame is not in this dictionary "
	ownedObjects ifNotNil:[ownedObjects removeKey:frame objectID].
	frame forceObjectOwner: frame.   "set the objectOwner back to self"
	frame frameChildrenDo:[:child | self removeOwnership: child.].
