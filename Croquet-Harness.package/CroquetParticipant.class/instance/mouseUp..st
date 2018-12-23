event handling
mouseUp: evt

	evt setPosition: evt position - self bounds topLeft.
	harness mouseUp: evt.
