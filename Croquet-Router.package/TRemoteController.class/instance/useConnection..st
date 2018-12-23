router switching
useConnection: aConnection

	self critical: [
		connection := aConnection.
		networkQueue := aConnection networkQueue.
		facets := aConnection facets.
	]