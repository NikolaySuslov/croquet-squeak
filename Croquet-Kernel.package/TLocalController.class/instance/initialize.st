initialize
initialize
	super initialize.
	lastTick := Time millisecondClockValue.
	timeStamp := (Time totalSeconds * 1000.0) + (Time millisecondClockValue \\ 1000).
	tickPeriod := 1000. "1/sec by default"
	status := #ready. "ready by default since I'm local"