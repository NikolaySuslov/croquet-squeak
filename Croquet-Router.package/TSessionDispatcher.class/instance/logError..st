server
logError: error
	logStream ifNil: [super logError: error] ifNotNil: [self logMessage: error description].
