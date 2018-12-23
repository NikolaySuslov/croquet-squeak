initialize
login: data from: aClient
	"aClient wants to login, e.g., authenticate itself. Format:
		[ 1 .. 16] Response facet
	The example router responds with a list of the facets to use."
	| responseFacet facetList |
	responseFacet := data copyFrom: 1 to: 16.
	"List the available facets"
	facetList := WriteStream on: (ByteArray new: 128).
	facetList 
		nextPutAll: (facets at: #joinFacet);
		nextPutAll: (facets at: #sendFacet);
		nextPutAll: (facets at: #syncFacet);
		nextPutAll: (facets at: #heartbeatFacet);
		nextPutAll: (facets at: #beServerFacet);
		nextPutAll: (facets at: #leaveFacet);
		nextPutAll: (facets at: #timeStampFacet);
	yourself.
	aClient outQueue nextPut: (TDatagram facet: responseFacet data: facetList contents).