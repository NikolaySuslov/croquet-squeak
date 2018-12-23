event loop
scheduleMessage: msgSend at: timeStamp
	"Schedule the given message deltaSeconds into the future"
	msgSend time: timeStamp.
	"FIXME: Wrapping below means that if we have an overflow messages scheduled after the overflow will be executed *before* messages scheduled earlier. It won't lead to any collisions (this would require wrap-around within a time slot) but it still is a problem since it may cause unpredictable effects on the code."
	msgSend sequenceNumber: (sequence := sequence + 1 bitAnd: 16r3FFFFFFF).
	messageQueue add: msgSend.