Instance variables:
	router		<TMessageRouter>	The router
	recvFacet	<TObjectID>			The recv: facet which allows me to receive msgs.
	syncFacets	<Dictionary: TObjectID -> TObjectID>	Maps incoming sync reply facets to outgoing reply facets.
	serveFacet	<TObjectID>			The serve: facet which allows me to recv a snapshot.
	tickFacet	<TObjectID>			The tick facet which allows me to get time information.
	listFacet		<TObjectID>			The list: facet which allows me to list other facets.
