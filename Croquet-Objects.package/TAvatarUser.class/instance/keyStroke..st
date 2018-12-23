events
keyStroke: event

	event keyValue = 1 ifTrue: [self toggleAvatarPerson. ^self. ].			"Ctl-A"
	event keyValue = 8 ifTrue: [replica future goToSpaceHome. ^self ].	"Ctl-H for home"
	event keyValue = 30 ifTrue:[
		event shiftPressed ifFalse:[
			replica future moveUp:1.]
		ifTrue:[self zoomIn.].
		^ self.
	].
	event keyValue = 31 ifTrue:[
		event shiftPressed ifFalse:[
			replica future moveDown:1.]
		ifTrue:[self zoomOut.].
		^ self.
	].
	replica future keyStroke: event.
