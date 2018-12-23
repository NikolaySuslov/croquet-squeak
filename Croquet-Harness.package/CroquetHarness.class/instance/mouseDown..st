event handling
mouseDown: evt

	event timeStamp: evt timeStamp.
	event shiftPressed: evt shiftPressed.
	event controlKeyPressed: evt controlKeyPressed.
" test for moving "
	(evt controlKeyPressed not and:[evt yellowButtonChanged]) ifTrue:[ 
		yellowButtonPressed := true.
		avatar mouseDown: evt.
	].
" test for object selection "
	evt redButtonChanged ifTrue:[
		avatar updateCamera: ogl camera.
		lastCameraTransform:= ogl camera globalTransform copy.
		redButtonPressed := true.
		eventPointer pointerDown: true.
		self pointerXY: evt position.
		event buttons: evt buttons.
		event keyValue: 0.
		event avatar: avatar replica.
		event camera: ogl camera.
		event selection: eventPointer selection.
		task doPointerDown: event.
	].

