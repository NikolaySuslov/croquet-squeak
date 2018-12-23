initialize
initialize
	super initialize.
	"Create a login facet that clients can use to connect to"
	facets at: TExampleController loginFacet put: (self messageFacetNamed: #login:from:).
