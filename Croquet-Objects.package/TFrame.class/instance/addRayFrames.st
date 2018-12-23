frameManagement
addRayFrames

	" When a frame is added as a child, any rays included in the heirarchy are reported to the base TSpace."
	self isRay ifTrue:[ self addRayFrame: self].
	frameChildren ifNotNil: [frameChildren do:[ :fc | fc addRayFrames ].].
	