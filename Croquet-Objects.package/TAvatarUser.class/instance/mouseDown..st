events
mouseDown: evt


	"Note when the button went down, so we can identify a button click later in mouseUp:."
	potentialYellowClick := true.
	lastYellowDownTime := Time millisecondClockValue.

	self startDriving.
	self controlPitch: evt shiftPressed.
