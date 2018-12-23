event loop
runEventLoop
	| msg |
	[true] whileTrue:[
		msg := eventQueue next.
		msg receiver perform: msg selector withArguments: msg arguments.
	].
