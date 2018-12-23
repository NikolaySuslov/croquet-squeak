initialize
destroy
	controller ifNotNil:[controller releaseConnection: self].
	super destroy.