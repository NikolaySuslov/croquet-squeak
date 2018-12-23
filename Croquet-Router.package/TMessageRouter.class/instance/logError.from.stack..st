server
logError: exception from: aClient stack: longStack
	| logMsg mtime |
	logMsg := 'xERROR: ', (self printClient: aClient), ' ', exception description.

	self logMessage:logMsg.
	logStream ifNotNil:[
		logStream cr; nextPutAll: longStack; flush.
	].

	TLogger withLogFileDo:[:file|
		mtime := DateAndTime now.
		file cr.
		mtime printYMDOn: file.
		file nextPut: $T.
		mtime printHMSOn: file.
		file cr; nextPutAll: logMsg; flush.
		file cr; nextPutAll: longStack; flush.
	].