events
doPointerDown: event

	(self eventMask anyMask: EventPointerDown) ifTrue:[
		(currentUser isNil or:[currentUser = event userID]) ifTrue:[
			event selection frame ifNil:[
				event selection frame: (self getOwnedObject: event selection frameID).
			].
			self pointerDown: event.
			currentUser := event userID.
			self signal: #pointerDown with: event.
		].
	] ifFalse:[
"now recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doPointerDown: event.
		].
	].