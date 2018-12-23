server
runServer
	"Run the server loop"
	| connectionSocket |
	self configureServer.
	[true] whileTrue:[
		connectionSocket := socket waitForAcceptFor: 60.
		"Fork this off since or else errors in acceptClient: kill the listener"
		connectionSocket ifNil: [socket isValid ifFalse: [^ self stopServer "Squeak just resumed after a suspend"]]
			ifNotNil:[self futureAcceptConnectionFrom: connectionSocket].
	].