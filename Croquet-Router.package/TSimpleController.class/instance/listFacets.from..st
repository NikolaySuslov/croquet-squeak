actions
listFacets: data from: aClient
	"Receive a list of invokable facets"
	| stream fid |
	connection sendCypher: (TARC4Cypher key: sessionKey).
	self revokeFacetCalled:  #listFacets.
	"Read facets"
	stream := data readStream.
	#(join send sync heartbeat beServer leave timeStamp) do:[:facetName|
		fid := stream nextInto: TObjectID nilObjectID.
		fid isZero ifFalse:[facets at: facetName put: fid].
	].
	status := #ready. "to roll"
	loginPromise onResolved: true.
	loginPromise := nil.