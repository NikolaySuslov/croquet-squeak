actions
send: data from: aClient
	"aClient wants to send, e.g., broadcast a replicated message"
	| msg logMsg |
	msg := TMessageData new.
	msg readFrom: data readStream.
	self isProxy ifTrue: [^ upstream sendMessage: msg].

	self stampMessage: msg.
	self dispatchMessage: msg.
	"log ifNotNil:[
		logMsg := 'SEND: ', (self printClient: aClient), ': ', msg selector.
		log cr; nextPutAll: logMsg; flush.
	]."
