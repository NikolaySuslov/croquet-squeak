event handling
mouseMove: evt

	|  newCameraTransform |
	self pointerXY: evt position.
	event timeStamp: evt timeStamp.
	event shiftPressed: evt shiftPressed.
	event controlKeyPressed: evt controlKeyPressed.
	yellowButtonPressed ifTrue:[
		avatar mouseMove: evt.
	].

	redButtonPressed ifTrue:[
		eventPointer pointerDown ifTrue: [
			avatar updateCamera: ogl camera.
			newCameraTransform := ogl camera globalTransform copy.
			eventPointer selectedRayTransform: eventPointer localTransform.
			eventPointer isOverlay ifFalse:[
				eventPointer selectedCameraTransform ifNotNil:[
					eventPointer selectedCameraTransform: lastCameraTransform orthoNormInverse * 					newCameraTransform * eventPointer selectedCameraTransform.
				]
			].
			lastCameraTransform := newCameraTransform.
"			eventPointer selectedCameraTransform: ogl camera globalTransform copy."
			avatar laserControl:  eventPointer redButton: redButtonPressed.

			event buttons: evt buttons.
			event shiftPressed: evt shiftPressed.
			event keyValue: 0.
			event camera: ogl camera.
			event avatar: avatar replica.
			event selection: eventPointer selection.

			task doPointerMove: event.
		].
	].