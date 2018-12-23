event handling
justDroppedInto: aMorph event: anEvent
	super justDroppedInto: aMorph event: anEvent.
	World doOneCycleNow.
	self removeProperty: #suppressStepping.
