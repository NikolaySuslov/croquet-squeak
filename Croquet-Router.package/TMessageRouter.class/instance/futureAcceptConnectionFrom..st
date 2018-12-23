server
futureAcceptConnectionFrom: aSocket
	"Fork it off, e.g. put it into the event queue"
	eventQueue nextPut: (MessageSend 
		receiver: self 
		selector: #acceptConnectionFrom: 
		argument: aSocket)
