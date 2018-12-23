actions
syncReply: data from: aClient facet: facet
	"Reply with snapshot data"
	| replyFacet |
	self revokeMessageFacet: facet.
	replyFacet := syncFacets removeKey: facet.
	router logMessage: 'SYNC: ', (router printClient: self), '  <-- ', data size asStringWithCommas,' bytes'.
	self outQueue nextPut: (TDatagram facet: replyFacet data: data)