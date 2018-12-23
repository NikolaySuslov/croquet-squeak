initialize
destroy
	router ifNotNil:[router removeClient: self].
	self stopHeartbeat.
	super destroy.
