events
pointerEnter: event

	selectedFrame := event selection frame.
	windowFrame material: matOver.
	windowButtons enable.
	rectFront material: matRectOver.
	rectBack material: matRectOver.
