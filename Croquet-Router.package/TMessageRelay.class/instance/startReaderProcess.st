reader
startReaderProcess
	self stopReaderProcess.
	reader := self fork:  #runReaderProcess at: Processor lowIOPriority.