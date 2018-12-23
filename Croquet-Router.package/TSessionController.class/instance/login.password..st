initialize
login: userName password: passHash
	"Perform a login with user, password and session ID. Note that login must be performed as the very first step after connecting to the router since it will be used to list the remote facets."
	| data responseFacet utf8Name loginFacet p |
	status := #authenticating.
	p := loginPromise := TPromise new.
	password := passHash.
	password isString ifTrue:[password := TCryptoRandom hashMessage: password].

	"Revoke prior startSession facet"
	responseFacet := facets at: #challenge ifAbsent:[nil].
	responseFacet ifNotNil:[self revokeMessageFacet: responseFacet].

	"Create a new challenge facet"
	responseFacet := self addMessageFacet: #challenge:from:.
	facets at: #challenge put: responseFacet.

	utf8Name := userName isoToUtf8.
	data := responseFacet, utf8Name.
	loginFacet := TSessionController loginFacet.
	connection outQueue nextPut: (TDatagram facet: loginFacet data: data).
	^p