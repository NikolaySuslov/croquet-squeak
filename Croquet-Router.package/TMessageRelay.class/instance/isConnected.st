testing
isConnected
	socket ifNil:[^false].
	^socket isConnected