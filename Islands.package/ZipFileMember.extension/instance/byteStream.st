*Islands
byteStream
	"Answer a suitable byte stream for the contents of the receiver.
	Intended to avoid *any* temporary decompression and conversion."
	| decoder |
	self rewindData.
	(compressionMethod = CompressionStored) ifTrue:[
		"Return uncompressed stream"
		^stream
	].
	(compressionMethod = CompressionDeflated) ifTrue:[
		"Return compressed stream"
		decoder := ZipReadStream on: stream.
		decoder expectedCrc: self crc32.
		^decoder
	].
	^self error: 'Unknown compression method'