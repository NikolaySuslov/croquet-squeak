facets
messageFacetNamed: aSelector
	"Create and answer an invokable facet for the given selector"
	^MessageSend receiver: self selector: aSelector