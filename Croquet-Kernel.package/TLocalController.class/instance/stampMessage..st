actions
stampMessage: msg
	"Put a time stamp on the given message"
	| nextTick delta |
	nextTick := Time millisecondClockValue.
	nextTick = lastTick ifFalse:[
		delta := nextTick - lastTick.
		"check for milliseconds clock overflow"
		delta < 0 ifTrue:[delta := 0].
		lastTick := nextTick.
		"update the current time stamp based on the number of msecs elapsed"
		timeStamp := timeStamp + delta.
	].
	msg time: timeStamp.