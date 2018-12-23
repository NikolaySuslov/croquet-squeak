*Croquet-Copier
exportLiteralOnIslandCopier: byteStream
	byteStream nextUInt32Put: self basicSize.
	byteStream nextPutAll: self asByteArray