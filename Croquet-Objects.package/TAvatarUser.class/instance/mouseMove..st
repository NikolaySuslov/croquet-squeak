events
mouseMove: evt

	"Called from the harness when the mouse is dragged with the drive (yellow) button down."
	potentialYellowClick := false.
	self controlPitch: evt shiftPressed.

