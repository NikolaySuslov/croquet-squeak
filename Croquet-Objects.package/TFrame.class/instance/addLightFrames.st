frameManagement
addLightFrames

	" When a frame is added as a child, any lights included in the heirarchy are reported to the base TRoom."
	self isLight ifTrue:[ self addLightFrame: self].
	frameChildren ifNotNil: [frameChildren do:[ :fc | fc addLightFrames ].].
	