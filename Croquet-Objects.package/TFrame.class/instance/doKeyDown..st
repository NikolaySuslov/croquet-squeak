events
doKeyDown: event

	(self eventMask anyMask: EventKeyboard) ifTrue:[
		event selection frame ifNil:[
			event selection frame: (self getOwnedObject: event selection frameID).
		].
		self keyDown: event.
		self signal: #keyDown with: event.
	] ifFalse:[
"otherwise recurse up the hierarchy"
		frameParent ifNotNil:[
			frameParent objectOwner doKeyDown: event.
		].
	].