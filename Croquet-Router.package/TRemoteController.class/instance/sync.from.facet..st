actions
sync: data from: aConnection facet: facet
	"Obtain snapshot data from connection."
	| syncPromise |
	self revokeMessageFacet: facet.
	syncPromise := aConnection promises removeKey: facet.
	syncPromise resolve: (data size = 0 ifTrue:[nil] ifFalse:[data])