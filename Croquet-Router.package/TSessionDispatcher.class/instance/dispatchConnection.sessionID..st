dispatching
dispatchConnection: aSocket sessionID: aSessionID
	| router |
	mutex critical:[
		router := routers at: aSessionID ifAbsentPut:[self autoCreateNewRouterFor: aSocket sessionID: aSessionID].
		router futureAcceptConnectionFrom: aSocket.
	].