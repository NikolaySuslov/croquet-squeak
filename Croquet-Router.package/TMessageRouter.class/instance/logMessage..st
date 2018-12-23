initialize
logMessage: aString
	"Log a message"
	logStream ifNotNil:[logStream cr; nextPutAll: aString; flush].