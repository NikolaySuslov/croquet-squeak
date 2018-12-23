actions
login: data from: aClient
	"aClient wants to login, e.g., authenticate itself. Format:
		[ 1 .. 16] MD5 hash of user name
		[17 .. 32] RC4 encrypted session key
		[33 .. 48] RC4 encrypted listFacets id
	Once session key is established it will be used for both directions.
	"
	| userHash passHash sessionKey listFacet cypher result |
	userHash := data copyFrom: 1 to: 16.
	passHash := self lookupHash: userHash ifAbsent:[
		^self error: 'Unknown user with hash: ', userHash
	].
	"self logStream cr ; show: 'client connected: ', (self printClient: aClient)."
	Transcript show:  'client connected: ', (self printClient: aClient).
	sessionKey := data copyFrom: 17 to: 32.
	listFacet := data copyFrom: 33 to: 48.

	"Decrypt session key and list facet"
	cypher := TARC4Cypher key: passHash.
	cypher process: sessionKey.
	cypher process: listFacet.
	aClient recvCypher: (TARC4Cypher key: sessionKey).
	aClient sendCypher: (TARC4Cypher key: sessionKey).

	"And list the facets for this client"
	result := 
		(facets at: #joinFacet),
		(facets at: #sendFacet),
		(facets at: #syncFacet),
		(facets at: #heartbeatFacet),
		(facets at: #beServerFacet),
		(facets at: #leaveFacet),
		(facets at: #timeStampFacet).
	aClient outQueue nextPut: (TDatagram facet: listFacet data: result).