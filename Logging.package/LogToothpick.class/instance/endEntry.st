as yet unclassified
endEntry
	
	isIgnore ifFalse: [ 

		self class LoggingEvent: [ :event | event category: category level: level message: stream contents ].
	].

	stream reset.