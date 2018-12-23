actions
joinComplete: data from: aConnection facet: facet
	"Joining is complete; from here on we'll get messages"
	| joinPromise |
	self revokeMessageFacet: facet.
	joinPromise := aConnection promises removeKey: facet.
	joinPromise resolve: true