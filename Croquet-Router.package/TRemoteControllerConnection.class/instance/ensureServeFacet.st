actions
ensureServeFacet
	"Act as a server, e.g., a participant trusted to replicate an island."
	| joinFacet serveFacet |
	"Revoke the prior #recv/serve facets"
	serveFacet := facets at: #serve ifAbsent:[nil].
	self flag: #mtf. "revoked too early"
	serveFacet ifNotNil:[self revokeMessageFacet: serveFacet].

	"Create a new #serve facet"
	serveFacet := self addMessageFacet:
		(controller messageFacetNamed: #serve:from:).
	facets at: #serve put: serveFacet.

	joinFacet := facets at: #beServer.
	outQueue nextPut: (TDatagram facet: joinFacet data: serveFacet).