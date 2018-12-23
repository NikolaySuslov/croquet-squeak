event handling
mouseLeave: evt from: sketch

	sketch framesToDwell: 20.
	focus = sketch ifTrue:[focus changed. focus := nil.].
