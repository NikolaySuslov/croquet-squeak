stepping
stopStepping
	stepRate := -1.
	Processor activeIsland unscheduleMessageMatching:[:msg|
		msg receiver == self and:[msg selector == #step].
	].
