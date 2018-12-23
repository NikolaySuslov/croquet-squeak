as yet unclassified
start

	self start.
	
	self LogClient: [ :sl |   ^ self ].

	^ self error: 'LogEngine is not loaded'