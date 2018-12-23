initialize
destroy
	connection ifNotNil:[connection destroy].
	self stopProxy.
	super destroy.