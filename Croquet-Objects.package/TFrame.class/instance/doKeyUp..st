events
doKeyUp: event

	(self eventMask anyMask: EventKeyboard) ifTrue:[
		event selection frame ifNil:[
			event selection frame: (self getOwnedObject: event selection frameID).
		].
		self keyUp: event.
		self signal: #keyUp with: event.
	] ifFalse:[
"otherwise recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doKeyUp: event.
		].
	].