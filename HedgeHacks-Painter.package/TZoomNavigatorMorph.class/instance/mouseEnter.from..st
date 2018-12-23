event handling
mouseEnter: evt from: sketch

	focus ifNotNil:[ focus changed. focus framesToDwell: 20].
	focus := sketch.
	focus framesToDwell: 20.
