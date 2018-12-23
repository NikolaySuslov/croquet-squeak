public
logError: anException
"Log a squeak error. by default, dumps the error to a file and makes a note of the error and the filename with the details"

	self numericLevel: (self numericLevel max: (Levels at: #error)).
	self logEntry: (ErrorLogEntry new
		error: anException;
		level: level;
		category: self category;
		sender: sender;
		pid: self pid;
		stamp: DateAndTime now;
		yourself)