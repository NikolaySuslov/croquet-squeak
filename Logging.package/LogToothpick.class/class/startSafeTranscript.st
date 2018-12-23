as yet unclassified
startSafeTranscript 
	"
	also we use the threadsafe transcript if available (from the Nile package)"

	| logger1  |

	self start.

	self isLoaded ifFalse: [ self error: 'Toothpick is not loaded' ].


	logger1 := self TranscriptLogger new.

	Smalltalk at: #ThreadSafeTranscript ifPresent: [ :t | 
			Smalltalk at: #Transcript put: t new.
			logger1 := ThreadSafeTranscriptLogger new.
	].
	
	Transcript open.
	 
	logger1 
		name: 'tlog';
		format: self TimestampLoggingFormatter iso8601Format;
		policy: (self LoggingPolicy new isInterestingBlock: [ :evt | true ]).

	(self LoggingMultiplexer current)
		addLogger: logger1;
 		startAllLoggers. 