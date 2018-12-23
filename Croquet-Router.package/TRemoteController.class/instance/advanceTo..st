actions
advanceTo: newTime
	super advanceTo: newTime.
	self isProxy ifTrue: [downstream timeStamp: newTime].