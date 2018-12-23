initialize
initialize
	super initialize.
	facets := Dictionary new.
	outQueue := SharedQueue new.
	buffer := ByteArray new: 512.
	recvCount := 0.
	sendCount := 0.
	recvAmount := 0.
	sendAmount := 0.
	isRecording := nil.
	messageRecorder := nil.
