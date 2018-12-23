initialize
connectTo: address port: port sessionID: aSessionID
	sessionID := aSessionID.
	status := #connecting.
	connection connectTo: address port: port sessionID: sessionID.
	status := connection ifNil:[#invalid] ifNotNil:[#connected].