actions
recv: data from: aConnection
	"Receive a broadcast message from aConnection"
	| msg logMsg |
	msg := TMessageData new.
	msg readFrom: data readStream.
	self isProxy ifTrue: [downstream dispatchMessage: msg].
	msg sender = senderID ifTrue:[self addToStatistics: msg].
	aConnection networkQueue nextPut: msg.
	log ifNotNil:[
		logMsg := 'RECV: ', msg selector.
		self log: logMsg.
	].