actions
timeStamp: data from: aClient
	"aClient wants to change the clock of the router. This probably should be an admin-only facet, once permissions are implemented"
	| stamp replyFacet |
	replyFacet := data copyFrom: 1 to: 16.
	stamp := 0.0 shallowCopy.
	stamp basicAt: 1 put: (data unsignedLongAt: 17 bigEndian: true).
	stamp basicAt: 2 put: (data unsignedLongAt: 21 bigEndian: true).

	self isProxy ifTrue: [self halt: 'Unimplemented'].
	"implement forwarding this message to the parent, and the reply"
	self flag: #mtf.

	self timeStamp: stamp.
	aClient outQueue nextPut: (TDatagram facet: replyFacet data: ByteArray new).
	self logMessage: 'STAMP: ', (self printClient: aClient), ' => ', stamp printString.