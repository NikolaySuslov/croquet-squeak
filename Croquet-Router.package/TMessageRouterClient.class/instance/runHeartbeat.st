heartbeat
runHeartbeat
	"Run the heartbeat process"
	| lastTick nextTick delta delay timeStamp |
	lastTick := router lastTick.
	timeStamp := router timeStamp.
	delay := Delay forMilliseconds: tickPeriod.
	[true] whileTrue:[
		"See if we've exceeded the period between ticks"
		nextTick := Time millisecondClockValue.
		router timeStamp > timeStamp ifTrue:[
			timeStamp := router timeStamp.
			lastTick := router lastTick.
		].
		delta := nextTick - lastTick.
		delta < 0 ifTrue:[delta := tickPeriod]. "clock overflow, send tick now"
		delta >= tickPeriod ifTrue:[
			tickFacet ifNotNil:[
				delta := nextTick - lastTick.
				"check for milliseconds clock overflow"
				delta < 0 ifTrue:[delta := 0].
				lastTick := nextTick.
				"Schedule message with router so serialize time stamps"
				router eventQueue nextPut: (MessageSend
					receiver: self
					selector: #sendTick
					arguments: #()).
			].
			delta := 0.
		].
		delay setDelayDuration: tickPeriod - delta.
		delay wait.
	].