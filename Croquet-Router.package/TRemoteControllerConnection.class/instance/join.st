actions
join
	"JOIN: Request to receive messages for this island."
	| recvFacet joinFacet respFacet joinPromise |
	"Revoke the prior receive facet"
	recvFacet := facets at: #recv ifAbsent:[nil].
	recvFacet ifNotNil:[self revokeMessageFacet: recvFacet].
	self flag: #mtf. "This facet is revoked too early. We may receive a message between now and when the new join completes"
	"Create a new #recv facet"
	recvFacet := self addMessageFacet:  
		(controller messageFacetNamed: #recv:from:).
	facets at: #recv put: recvFacet.

	"Create response facet"
	respFacet := self addMessageFacet: 
		(controller messageFacetNamed: #joinComplete:from:facet:).
	joinPromise := TPromise new.
	promises at: respFacet put: joinPromise.

	joinFacet := facets at: #join.
	outQueue nextPut: (TDatagram facet: joinFacet data: recvFacet, respFacet).
	^joinPromise