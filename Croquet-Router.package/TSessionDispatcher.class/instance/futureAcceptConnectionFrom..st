server
futureAcceptConnectionFrom: aSocket
	self logMessage: 'Connection from ', aSocket remotePrettyString, '.'.
	super futureAcceptConnectionFrom: aSocket.