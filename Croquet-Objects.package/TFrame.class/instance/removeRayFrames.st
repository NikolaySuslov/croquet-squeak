frameManagement
removeRayFrames

	" When a frame is disconnected from its parent, we need to remove the references to the rays in the TSpace."
	self isRay ifTrue:[self removeRayFrame: self.].
	frameChildren ifNotNil:[frameChildren do:[ :fc | fc removeRayFrames ].].
	