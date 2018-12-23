actions
leave: data from: aClient
	"aClient wants to leave, e.g., stop receiving messages"
	self logMessage: 'LEAVE: ', (self printClient: aClient).
	aClient recvFacet: nil.
	aClient destroy.
