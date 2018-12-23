dispatching
dispatchConnection: aSocket sessionID: aSessionID
	| router |
	mutex critical:[
		router := routers at: aSessionID ifAbsentPut:[self autoCreateNewRouter].
		router futureAcceptConnectionFrom: aSocket.
	].