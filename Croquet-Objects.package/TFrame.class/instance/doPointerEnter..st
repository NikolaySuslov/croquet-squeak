events
doPointerEnter: event

	(self eventMask anyMask: EventPointerOver) ifTrue:[
		currentUser ifNil:[
			event selection frame ifNil:[
				event selection frame: (self getOwnedObject: event selection frameID).
			].
			currentUser := event userID.
			self pointerEnter: event.
			self signal: #pointerEnter with: event.
		].
	].
	(self eventMask anyMask: EventBlockRecurse)ifFalse:[
"now (always) recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doPointerEnter: event.
		].
	].