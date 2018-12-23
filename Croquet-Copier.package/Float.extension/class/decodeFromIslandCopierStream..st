*Croquet-Copier
decodeFromIslandCopierStream: byteStream
	| lit value |
	lit := byteStream next: 8.
	value := 0 asFloat.
	value basicAt: 1 put: (lit unsignedLongAt: 1 bigEndian: true).
	value basicAt: 2 put: (lit unsignedLongAt: 5 bigEndian: true).
	^value