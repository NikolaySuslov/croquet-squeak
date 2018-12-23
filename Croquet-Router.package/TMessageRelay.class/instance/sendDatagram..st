writer
sendDatagram: datagram
	"Push the datagram down to the client"
	| facet data ba sz cryptData crc |
	facet := datagram facet.
	data := datagram data.
	"Compute checksum for transmission"
	crc := 16rFFFFFFFF.
	crc := self updateCrc: crc from: 1 to: facet size in: facet.
	crc := self updateCrc: crc from: 1 to: data size in: data.
	crc := crc bitXor: 16rFFFFFFFF.

	ba := ByteArray new: 8.
	ba unsignedLongAt: 1 put: data size bigEndian: true. "network order"
	ba unsignedLongAt: 5 put: crc bigEndian: true. "network order"
	buffer replaceFrom: 1 to: (sz := ba size) with: ba startingAt: 1.
	buffer replaceFrom: sz+1 to: (sz := sz + facet size) with: facet startingAt: 1.
	(facet size + data size + ba size <= buffer size) ifTrue:[
		"fits buffer; send as a single chunk"
		SmallPackets := SmallPackets + 1.
		buffer replaceFrom: sz+1 to: (sz := sz + data size) with: data startingAt: 1.
		sendCypher ifNotNil:[sendCypher process: buffer from: 9 to: sz].
		self sendData: buffer count: sz.
		buffer from: 1 to: sz put: 0.
	] ifFalse:[
		"doesn't fit - send as two chunks"
		LargePackets := LargePackets + 1.
		sendCypher ifNotNil:[sendCypher process: buffer from: 9 to: sz].
		self sendData: buffer count: sz.
		buffer from: 1 to: sz put: 0.
		sendCypher ifNil:[
			self sendData: data count: data size.
		] ifNotNil:[
			"It is unfortunate but we need a copy for the sent data here
			since it may be shared with other queues."
			cryptData := data shallowCopy.
			sendCypher process: cryptData.
			self sendData: cryptData count: cryptData size.
		].
	].
	sendCount := sendCount + 1.
	"Evaluate completion block"
	datagram complete value.