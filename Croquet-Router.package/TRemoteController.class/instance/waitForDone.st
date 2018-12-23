actions
waitForDone

	self flag: #jrd. "This is probably the wrong approach to this,"
	[self allPromisesEmpty]
		whileFalse: [ (Delay forMilliseconds: 2) wait ].
