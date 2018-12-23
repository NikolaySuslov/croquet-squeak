actions
recvFacets: data from: aConnection
	"Receive a list of invokable facets"
	| facet stream fid |
	facet := facets at: #recvFacets.
	self revokeMessageFacet: facet.  "revoke recvFacets:from:"
	"Read facets"
	stream := data readStream.
	#(join send sync heartbeat beServer leave timeStamp) do:[:facetName|
		fid := stream nextInto: TObjectID nilObjectID.
		fid isZero ifFalse:[facets at: facetName put: fid].
	].
	status := #ready. "to roll"
	loginPromise onResolved: true.
	loginPromise := nil.