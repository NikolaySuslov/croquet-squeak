server
logMessage: aString
	| mtime |
	logStream ifNotNil: [
		mtime := DateAndTime now.
		logStream cr.
		mtime printYMDOn: logStream.
		logStream nextPut: $T.
		mtime printHMSOn: logStream.
		logStream
			nextPutAll: ' : 	';
			nextPutAll: aString;
			flush
	].