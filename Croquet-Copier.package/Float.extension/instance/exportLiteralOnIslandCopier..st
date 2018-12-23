*Croquet-Copier
exportLiteralOnIslandCopier: byteStream
	| lit |
	lit := ByteArray new: 8.
	lit unsignedLongAt: 1 put: (self basicAt: 1) bigEndian: true.
	lit unsignedLongAt: 5 put: (self basicAt: 2) bigEndian: true.
	byteStream nextPutAll: lit.