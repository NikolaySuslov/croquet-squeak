events
mouseUp: evt

	| maxDownTimeForClick |
	self stopDriving.
	self controlPitch: evt shiftPressed.

	"UI policy setting... if the button is down longer than 300 ms, don't do a jump for the click."
	maxDownTimeForClick := 360.

	(potentialYellowClick 
	 and:[(Time millisecondClockValue - lastYellowDownTime) abs < maxDownTimeForClick]) 
	ifTrue: [
			self takeMeThere: evt.
	].

	potentialYellowClick := false.