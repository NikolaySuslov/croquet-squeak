event handling
keyUp: anEvent

	event timeStamp: anEvent timeStamp.
	event buttons: anEvent buttons.
	event keyValue: anEvent keyValue.
	event avatar: avatar replica.
	event shiftPressed: anEvent shiftPressed.
	event controlKeyPressed: anEvent controlKeyPressed.

"if we are pointing to something then send the event to that, otherwise send to avatar"

	eventPointer selectedTarget ifNotNil:[
		(task doKeyUp: event) ifTrue:[ ^ self. ].
	].

	avatar keyUp: event.

	