server
acceptConnectionFrom: aSocket
	"Accept a new client socket"
	| count id |
	"Disable TCP delays"
	aSocket setOption: 'TCP_NODELAY' value: true.
	id := TObjectID nilObjectID.
	aSocket waitForData.
	count := 0.
	[count < id size] whileTrue:[
		aSocket isConnected ifFalse:[ConnectionClosed signal:'Connection closed'].
		count := count + (aSocket receiveDataInto: id startingAt: count+1).
	].
	self dispatchConnection: aSocket sessionID: id.