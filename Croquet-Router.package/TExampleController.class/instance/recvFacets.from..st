initialize
recvFacets: data from: aClient
	"Receive a list of invokable facets"

	| stream fid |
	self revokeFacetCalled: #recvFacets.
	"Read facets"
	stream := data readStream.
	#(join send sync heartbeat beServer leave timeStamp) do:[:facetName|
		"receive the facet identifiers and map them to the message symbols
		See TExampleRouter>>login:from:"
		fid := stream nextInto: TObjectID nilObjectID.
		fid isZero ifFalse:[facets at: facetName put: fid].
	].
	status := #ready. "to roll"
	loginPromise onResolved: true.
	loginPromise := nil.