events
pointerOver: event

	selectedFrame = event selection frame ifFalse:[
		self pointerLeave: event.
		self pointerEnter: event.].
