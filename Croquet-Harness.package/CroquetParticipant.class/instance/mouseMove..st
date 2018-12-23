event handling
mouseMove: evt

	evt setPosition: evt position - self bounds topLeft.
	harness mouseMove: evt.