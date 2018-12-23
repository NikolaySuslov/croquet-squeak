actions
stampComplete: data from: aConnection facet: respFacet
	"Router time stamp is complete; from here on we'll use the new time basis"
	| stampPromise |
	"Drop the old network queue - any external messages are 
	invalid after a change in the time base"
	connection networkQueue: SharedQueue new.
	networkQueue := connection networkQueue.
	self revokeMessageFacet: respFacet.
	stampPromise := aConnection promises removeKey: respFacet.
	stampPromise resolve: true.