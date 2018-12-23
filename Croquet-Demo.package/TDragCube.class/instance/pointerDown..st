events
pointerDown: event

	selectedPoint := event selection point.
	norm := event selection normal.
	self hilite: TButton downColor.