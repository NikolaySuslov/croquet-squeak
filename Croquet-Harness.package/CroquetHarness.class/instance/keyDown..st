event handling
keyDown: anEvent

	event timeStamp: anEvent timeStamp.
	event buttons: anEvent buttons.
	event keyValue: anEvent keyValue.
	event avatar: avatar replica.
	event shiftPressed: anEvent shiftPressed.
	event controlKeyPressed: anEvent controlKeyPressed.
	event selection: eventPointer selection.
"if we are pointing to something then send the event to that, otherwise send to avatar"

	eventPointer selectedTarget ifNotNil:[
		(task doKeyDown: event)ifTrue:[ ^ self. ].
	].

	avatar keyDown: event.	