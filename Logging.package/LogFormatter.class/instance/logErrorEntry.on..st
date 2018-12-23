error
logErrorEntry: aLogEntry on: aStream
	| filename |
	filename := self errorDumpFileName.
	Smalltalk dumpException: aLogEntry error to: filename.
	aLogEntry line: aLogEntry error description, '; stack written to ', filename.
	self logTextEntry: aLogEntry on: aStream