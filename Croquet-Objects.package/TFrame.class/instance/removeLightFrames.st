frameManagement
removeLightFrames

	" When a frame is disconnected from its parent, we need to remove the references to the lights in the TRoom."
	self isLight ifTrue:[self removeLightFrame: self.].
	frameChildren ifNotNil:[frameChildren do:[ :fc | fc removeLightFrames ].].
	