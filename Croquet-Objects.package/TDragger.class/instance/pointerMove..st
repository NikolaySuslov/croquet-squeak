events
pointerMove: event

	event shiftPressed ifTrue:[^ self doSpin:event.].
	self doDrag: event.

