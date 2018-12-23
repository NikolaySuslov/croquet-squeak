*Croquet-Copier
decodeFromIslandCopierStream: byteStream
	^(byteStream next: (byteStream nextUInt32)) asString asSymbol.
