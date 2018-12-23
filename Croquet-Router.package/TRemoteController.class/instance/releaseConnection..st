initialize
releaseConnection: aConnection
	aConnection == connection ifTrue:[
		connection := nil.
		status := #invalid.
		self breakPromises.
	].