events
doPointerMove: event

	(self eventMask anyMask: EventPointerDown) ifTrue:[
		currentUser = event userID ifTrue:[
			event selection frame ifNil:[
				event selection frame: (self getOwnedObject: event selection frameID).
			].
			self pointerMove: event.
			self signal: #pointerMove with: event.
		].
	] ifFalse:[

"now recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doPointerMove: event.
		].
	].