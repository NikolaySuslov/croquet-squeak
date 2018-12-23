server
removeClient: aClient
	"Add a new client to my list of clients"
	self logMessage: 'Destroying client: ', (self printClient: aClient).
	clients := clients copyWithout: aClient.
	(autoStop and:[clients isEmpty]) ifTrue:[
		eventQueue nextPut: (MessageSend receiver: self selector: #destroy).
	].
