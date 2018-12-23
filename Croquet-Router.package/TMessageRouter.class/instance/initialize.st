initialize
initialize
	super initialize.
	eventQueue := SharedQueue new.
	clients := #().
	facets := Dictionary new.
	lastTick := Time millisecondClockValue.
	timeStamp := Time totalSeconds * 1000.0 + (Time millisecondClockValue \\ 1000).
	self startEventLoop.
	autoStop := true.

	self initializeFacets.