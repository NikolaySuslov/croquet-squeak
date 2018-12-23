server
acceptConnectionFrom: aSocket
	"Accept a new client socket"
	| client |
	client := self newMessageRouterClient.
	client address: aSocket remoteAddress port: aSocket remotePort.
	client socket: aSocket.
	client router: self.
	client eventQueue: eventQueue.
	client facets: Dictionary new.
	facets keysAndValuesDo:[:key :val| client facets at: key put: val].
	client startUp.
	self logMessage: '{New client: ', (self printClient: client) , '}'.
	clients := clients copyWith: client.
	shouldLog
		ifNotNil:[
			clients
				do:[:each| logStream crtab; nextPutAll: (self printClient: each). ].
			logStream flush.
			logStream nextPutAll: '}' ; cr ; flush.
		].