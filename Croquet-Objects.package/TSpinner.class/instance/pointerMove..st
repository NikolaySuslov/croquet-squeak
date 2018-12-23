events
pointerMove: event

	event shiftPressed ifTrue:[^ self doDrag:event.].
	self doSpin: event.

