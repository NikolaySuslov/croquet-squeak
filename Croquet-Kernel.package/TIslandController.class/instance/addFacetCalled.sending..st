facets
addFacetCalled: symbolName sending: selector

	| msgFacet |
	msgFacet := self addMessageFacet: selector.
	facets at: symbolName put: msgFacet.
	^msgFacet
