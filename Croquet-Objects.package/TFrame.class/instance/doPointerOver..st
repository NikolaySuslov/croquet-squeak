events
doPointerOver: event

	(self eventMask anyMask: EventPointerOver) ifTrue:[
		currentUser = event userID ifTrue:[
			event selection frame ifNil:[
				event selection frame: (self getOwnedObject: event selection frameID).
			].
			self pointerOver: event.
			self signal: #pointerOver with: event.
		].
	].

	(self eventMask anyMask: EventBlockRecurse)ifFalse:[
	"now (always) recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doPointerOver: event.
		].
	].