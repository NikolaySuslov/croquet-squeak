as yet unclassified
startTranscript 
 	| logger1  |

	self start.

	self isLoaded ifFalse: [ self error: 'Toothpick is not loaded' ].

	logger1 := self TranscriptLogger new.
		 
	logger1 
		name: 'tlog';
		format: self TimestampLoggingFormatter iso8601Format;
		policy: (self LoggingPolicy new isInterestingBlock: [ :evt | true ]).

	(self LoggingMultiplexer current)
		addLogger: logger1;
 		startAllLoggers. 