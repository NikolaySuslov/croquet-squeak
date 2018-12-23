event handling
mouseUp: evt

	event timeStamp: evt timeStamp.
	event shiftPressed: evt shiftPressed.
	event controlKeyPressed: evt controlKeyPressed.
	evt yellowButtonChanged ifTrue:[
		yellowButtonPressed := false.
		avatar mouseUp: evt.
	].
	evt redButtonChanged ifTrue:[
		eventPointer pointerDown ifTrue:[
			eventPointer pointerDown: false.
			(eventPointer selectedEventMask anyMask:TFrame eventPointerDown) ifTrue:[
				avatar laserControl:  eventPointer redButton: false.
				event buttons: evt buttons.
				event shiftPressed: evt shiftPressed.
				event keyValue: 0.
				event avatar: avatar replica.
				event selection: eventPointer selection.
				event camera: ogl camera.
				task doPointerUp: event.
"after a #doPointerUp: we sent a #doPointerLeave: and force a pointer reset. This allows others to grab the object"
				task doPointerLeave: event.
				eventPointer resetTotal.
			].
		].
		redButtonPressed := false.
	].
