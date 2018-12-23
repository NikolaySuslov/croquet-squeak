frameManagement
removePortalFrames

	" When a frame is disconnected from its parent, we need to remove the references to the lights in the TRoom."
	self isPortal ifTrue:[self removePortalFrame: self.].
	frameChildren ifNotNil:[frameChildren do:[ :fc | fc removePortalFrames ].].
	