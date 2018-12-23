writer
startWriterProcess
	self stopWriterProcess.
	writer := self fork: #runWriterProcess at: Processor lowIOPriority.