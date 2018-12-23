*Islands
byteStream
	"Answer a suitable byte stream for the contents of the receiver.
	Intended to avoid *any* temporary decompression and conversion.
	However, as a general fallback we simply use #contentStream."
	^(self contentStream)
		binary; 
		yourself