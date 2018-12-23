actions
join: data from: aClient
	"aClient wants to join, e.g., receive messages"
	| recvFacet responseFacet |
	recvFacet := data copyFrom: 1 to: 16.
	responseFacet := data copyFrom: 17 to: 32.
	aClient recvFacet: recvFacet.
	aClient outQueue nextPut: (TDatagram facet: responseFacet data: ByteArray new).
	self logMessage: 'JOIN: ', (self printClient: aClient).
	self isProxy ifTrue: [upstream facets at: #recv ifAbsent: [upstream join]].