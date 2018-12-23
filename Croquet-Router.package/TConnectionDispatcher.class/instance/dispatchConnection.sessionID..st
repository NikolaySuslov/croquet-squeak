server
dispatchConnection: aSocket sessionID: aSessionID
	"Dispatch the socket to the appropriate router."
	^self subclassResponsibility