frameManagement
addPortalFrames

	" When a frame is added as a child, any portals included in the heirarchy are reported to the base TRoom."
	self isPortal ifTrue:[ self addPortalFrame: self].
	frameChildren ifNotNil: [frameChildren do:[ :fc | fc addPortalFrames ].].
	