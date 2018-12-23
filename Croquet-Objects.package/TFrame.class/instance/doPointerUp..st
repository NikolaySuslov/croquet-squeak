events
doPointerUp: event

	(self eventMask anyMask: EventPointerDown) ifTrue:[
		currentUser = event userID ifTrue:[
			event selection frame ifNil:[
				event selection frame: (self getOwnedObject: event selection frameID).
			].
			self pointerUp: event.
			self signal: #pointerUp with: event.
		].
	] ifFalse:[

"now recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doPointerUp: event.
		].
	].