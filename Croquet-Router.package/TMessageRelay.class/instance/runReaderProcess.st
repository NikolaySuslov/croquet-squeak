reader
runReaderProcess
	"Wire protocol layout
		buf(byte * 8) - Note that this is not encrypted...is this a problem?
			sz (byte * 4) - size of data
			stored(byte * 4) - CRC of data after decryption
		fid(TObjectID * 1) - facetID
		data(byte * sz)
	"

	| fid facet buf sz data done stored crc |
	fid := TObjectID for: 'Facet'.
	buf := ByteArray new: 8.
	done := false.
	[done] whileFalse:[
		[
			buf atAllPut: 0. fid atAllPut: 0.
			socket waitForData.
			self receiveDataInto: buf.
			self receiveDataInto: fid.
			socket isConnected ifFalse:["connection closed"
				^eventQueue nextPut:(MessageSend receiver: self selector: #destroy)
			].
			sz := buf unsignedLongAt: 1 bigEndian: true. "network order"
			stored := buf unsignedLongAt: 5 bigEndian: true.
			data := ByteArray new: sz.
			sz > 0 ifTrue:[self receiveDataInto: data].
			recvCypher ifNotNil:["decrypt facet and actual message data"
				recvCypher process: fid.
				recvCypher process: data.
			].
			"Compute checksum for transmission"
			crc := 16rFFFFFFFF.
			crc := self updateCrc: crc from: 1 to: fid size in: fid.
			crc := self updateCrc: crc from: 1 to: data size in: data.
			crc := crc bitXor: 16rFFFFFFFF.
			stored = crc ifFalse:[self crcError: 'Checksum error'].
			facet := facets at: fid ifAbsent:[self errorNoSuchFacet: fid].
			
			"facet ifNotNil:[self invokeFacet: facet with: data]."
			
			isRecording
				ifNotNil: [messageRecorder recordSz: sz crc: stored fid: fid data: data facet: facet].
			facet ifNotNil:[self invokeFacet: facet with: data id: fid].
			recvCount := recvCount + 1.
		] on: Error do:[:ex|
			eventQueue nextPut:(MessageSend 
				receiver: self 
				selector: #handleError:stack: 
				arguments: (Array with: ex with: ex signalerContext longStack)).
			done := true.
			ex return.
		].
	].
