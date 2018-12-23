update
onEvent2D: evtBuffer
	eventQueue nextPut: evtBuffer.
"
	((evtBuffer at: 1) = #mouse and:[(evtBuffer at: 5) = 0])
		ifFalse:[Transcript cr; show: Time millisecondClockValue; show: evtBuffer].
"