heartbeat
sendTick
	| timeStamp data |
	router stampMessage: tickMsg.
	timeStamp := tickMsg time.
	data := ByteArray new: 8.
	data unsignedLongAt: 1 put: (timeStamp basicAt: 1) bigEndian: true.
	data unsignedLongAt: 5 put: (timeStamp basicAt: 2) bigEndian: true.
	outQueue nextPut: (TDatagram facet: tickFacet data: data).
