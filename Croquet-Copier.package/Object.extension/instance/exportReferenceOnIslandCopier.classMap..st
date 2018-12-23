*Croquet-Copier
exportReferenceOnIslandCopier: byteStream classMap: classMap
	byteStream nextNumber: 4 put: 0.
	byteStream nextNumber: 4 put: (classMap at: self class).
	self exportLiteralOnIslandCopier: byteStream.