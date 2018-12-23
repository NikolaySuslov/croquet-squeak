event handling
keyStroke: anEvent

	| controlWasPressed shiftWasPressed |
	"XXXX: FIXME: Use the control and shift key bit from the last event to make 
	scroll wheel events work correctly with those keys."
	shiftWasPressed := event shiftPressed.
	controlWasPressed := event controlKeyPressed.
		event buttons: anEvent buttons.
		event keyValue: anEvent keyValue.
		event avatar: avatar replica.
		event selection: eventPointer selection.
	event controlKeyPressed: controlWasPressed.
	event shiftPressed: shiftWasPressed.
"if we are pointing to something then send the event to that, otherwise send to avatar"

	eventPointer selectedTarget ifNotNil:[
		(task doKeyStroke: event)ifTrue:[^ self.].
	].

	avatar keyStroke: event.	