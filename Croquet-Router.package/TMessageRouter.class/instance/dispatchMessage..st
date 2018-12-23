actions
dispatchMessage: msg
	| data |
	data := msg asByteArray.
	clients do:[:each| each recvFacet ifNotNil:[
		each outQueue nextPut: (TDatagram facet: each recvFacet data: data).
	]].