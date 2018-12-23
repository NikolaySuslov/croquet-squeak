resolving
onResolved: aBoolean
	"This could possibly be to block? I do not know"
	"Let us try this:"
	self assert: self isResolved not.
	self resolve: aBoolean
	"
CobaltController>>recvFacets:from:facet: 
shows:
loginPromise resolve: true."