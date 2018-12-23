writer
stopWriterProcess

	writer ifNotNil:[writer terminate].
	writer := nil.