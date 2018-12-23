actions
sync: resID
	"SYNC: Request a copy of some resource from the router."
	| facet syncPromise |
	facet := self addMessageFacet: 
		(controller messageFacetNamed: #sync:from:facet:).
	syncPromise := promises at: facet put: TPromise new.
	outQueue nextPut: (TDatagram facet: (facets at: #sync) data: facet, resID).
	^syncPromise