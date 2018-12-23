*Croquet-Copier
storeWordsFrom: aCollection
	"Write the argument a word-like object in big endian format on the receiver.
	May be used to write other than plain word-like objects (such as ColorArray)."
	| bytes |
	bytes := ByteArray new: aCollection basicSize * 4.
	(Form new hackBits: aCollection) displayOn: (Form new hackBits: bytes).
	self nextPutAll: bytes.
	^aCollection