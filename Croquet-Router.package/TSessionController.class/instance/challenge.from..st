actions
challenge: data from: aConnection
	"Router sends challenge to start this session. Format:
		[ 1 .. 16] - Encrypted session key
		[17 .. 32] - Encrypted list facet
	After the session key has been decrypted, we can make full use the connection."
	| facet listFacet sessionKey |

	"Revoke old startSession facet"
	facet := facets at: #challenge ifAbsent:[nil].
	facet ifNotNil:[self revokeMessageFacet: facet].

	"Decode session key and listFacet"
	sessionKey := password bitXor: (data copyFrom: 1 to: 16).
	listFacet := password bitXor: (data copyFrom: 17 to: 32).
	password := nil. "don't need that any longer"

	"Set up the cyphers"
	connection sendCypher: (TARC4Cypher key: sessionKey).
	connection recvCypher: (TARC4Cypher key: sessionKey).

	"Create the response to invoke"
	facet := facets at: #recvFacets ifAbsent:[nil].
	facet ifNotNil:[self revokeMessageFacet: facet].
	facet := self addMessageFacet: #recvFacets:from:.
	facets at: #recvFacets put: facet.

	connection outQueue nextPut: (TDatagram facet: listFacet data: facet).