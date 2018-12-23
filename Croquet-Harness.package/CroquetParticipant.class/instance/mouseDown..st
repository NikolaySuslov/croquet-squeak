event handling
mouseDown: evt

	evt setPosition: evt position - self bounds topLeft.
	harness mouseDown: evt.
