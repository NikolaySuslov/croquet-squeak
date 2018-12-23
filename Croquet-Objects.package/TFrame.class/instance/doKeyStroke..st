events
doKeyStroke: event

	(self eventMask anyMask: EventKeyboard) ifTrue:[
		event selection frame ifNil:[
			event selection frame: (self getOwnedObject: event selection frameID).
		].
		self keyStroke: event.
		self signal: #keyStroke with: event.
	] ifFalse:[
"otherwise recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doKeyStroke: event.
		].
	].