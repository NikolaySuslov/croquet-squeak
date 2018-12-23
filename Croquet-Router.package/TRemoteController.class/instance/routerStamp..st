actions
routerStamp: timeValue
	"ROUTERSTAMP: Change the router's time stamp"
	| stampData stampFacet replyFacet stampPromise |
	replyFacet := self addMessageFacet: #stampComplete:from:facet:.
	stampPromise := connection promises at: replyFacet put: TPromise new.
	stampFacet := facets at: #timeStamp.
	stampData := ByteArray new: 8.
	stampData unsignedLongAt: 1 put: (timeValue basicAt: 1) bigEndian: true.
	stampData unsignedLongAt: 5 put: (timeValue basicAt: 2) bigEndian: true.
	connection outQueue nextPut: (TDatagram facet: stampFacet data: replyFacet, stampData).
	^stampPromise