logging
log: aString
	"Log aString"
	| mtime |
	self withLogFileDo:[:file|
		mtime := DateAndTime now.
		file cr.
		mtime printYMDOn: file.
		file nextPut: $T.
		mtime printHMSOn: file.
		file
			nextPutAll: ' : 	'.
		file cr; nextPutAll: aString.
		file flush.
	].