heartbeat
runHeartbeat
	"Run the heartbeat process"
	| nextTick delta delay |
	tickMsg := TMessageData new.
	delay := Delay forMilliseconds: tickPeriod.
	[true] whileTrue:[
		"See if we've exceeded the period between ticks"
		nextTick := Time millisecondClockValue.
		delta := nextTick - lastTick.
		delta < 0 ifTrue:[delta := tickPeriod]. "clock overflow, send tick now"
		delta >= tickPeriod ifTrue:[
			self stampMessage: tickMsg.
			eventQueue nextPut:
				(MessageSend receiver: self selector: #advanceTo: argument: tickMsg time).
			delta := 0.
		].
		delay setDelayDuration: tickPeriod - delta.
		delay wait.
	].