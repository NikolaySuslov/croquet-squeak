as yet unclassified
reset
	self stop
	self isLoaded ifFalse: [ self error: 'Toothpick is not loaded' ].
	
	self LoggingMultiplexer current stopAllLoggers.
	self LoggingMultiplexer reset. 