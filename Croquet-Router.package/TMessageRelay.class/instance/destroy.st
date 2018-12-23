initialize
destroy
	self stopReaderProcess.
	self stopWriterProcess.
	socket ifNotNil:[
		socket destroy.
		socket := nil.
	].
