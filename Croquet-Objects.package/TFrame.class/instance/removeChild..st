hierarchy
removeChild: child

	self root ifNotNil:[ self root doStop:child].
	objectOwner removeOwnership: child.
	child removeLightFrames.
	child removePortalFrames.	
	child removeRayFrames.
	child root: nil.
	frameChildren ifNotNil:[frameChildren remove: child ifAbsent:[].].
	child parent: nil.
	self signal: #structureChanged.