event loop
runEventLoop
	| msg |
	[true] whileTrue:[
		msg := eventQueue next.
		messageRecorder
			ifNotNilDo: [ :x | x recordMsg: msg].
		msg receiver perform: msg selector withArguments: msg arguments.
	].
