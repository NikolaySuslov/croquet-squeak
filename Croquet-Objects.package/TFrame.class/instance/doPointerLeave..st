events
doPointerLeave: event

	(self eventMask anyMask: EventPointerOver) ifTrue:[
		currentUser = event userID ifTrue:[
			event selection frame ifNil:[
				event selection frame: (self getOwnedObject: event selection frameID).
			].
			self signal: #pointerLeave with: event.
			self pointerLeave: event.
			currentUser := nil.
		].
	].
	(self eventMask anyMask: EventBlockRecurse)ifFalse:[
"now (always) recurse up the hierarchy"
		frameParent ifNotNil:[
			(frameParent objectOwner getAllEventsHandled anyMask: EventPointerOver) ifTrue:[
				frameParent objectOwner doPointerLeave: event.
			].
		].
	].