as yet unclassified
startFile: filename
 
| logger1  |
 
	self start.

	self isLoaded ifFalse: [ self error: 'Toothpick is not loaded' ].

	logger1 := FileLogger new
	fileName: filename;
	format: self TimestampLoggingFormatter iso8601Format;
	policy: (self LoggingPolicy new isInterestingBlock: [ :evt | true ]).

	(self LoggingMultiplexer current)
	addLogger: logger1;
 
	startAllLoggers.   
 
 