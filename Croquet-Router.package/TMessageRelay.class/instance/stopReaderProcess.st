reader
stopReaderProcess
	reader ifNotNil:[reader terminate].
	reader := nil.