initialization
openInWorld
	super openInWorld.
	World doOneCycleNow.
	self removeProperty: #suppressStepping.
