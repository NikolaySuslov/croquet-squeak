initialize
userHash: userHash passHash: passHash
	"Use usrName/pwd for the simple router"
	| loginFacet listFacet cryptKey cryptFacet cypher p |
	p := loginPromise := TPromise new.
	status := #authenticating.

	self revokeFacetCalled: #listFacets.

	"Create login facet"
	loginFacet := TCryptoRandom arc4: userHash key: passHash.

	"Create new session key"
	sessionKey := TObjectID for: 'Session'.

	"Install decoding cypher"
	connection recvCypher: (TARC4Cypher key: sessionKey).

	listFacet := self addFacetCalled: #listFacets sending: #listFacets:from:.

	"Encode session key and list facet"
	cryptKey := sessionKey shallowCopy.
	cryptFacet := listFacet shallowCopy.
	cypher := TARC4Cypher key: passHash.
	cypher process: cryptKey.
	cypher process: cryptFacet.

	"Create a promise so client code gets informed when listing complete"
	connection outQueue nextPut: (TDatagram facet: loginFacet data: userHash, cryptKey, cryptFacet).
	^p