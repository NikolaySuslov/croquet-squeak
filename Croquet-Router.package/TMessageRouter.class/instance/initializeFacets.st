initialize
initializeFacets
	"Initialize standard facets"
	| facetName selector facet |
	#(join leave sync heartbeat send beServer timeStamp) do:[:symbol|
		facetName := (symbol,'Facet') asSymbol.
		selector := (symbol,':from:') asSymbol.
		facet := self addMessageFacet: selector.
		facets at: facetName put: facet.
	].
