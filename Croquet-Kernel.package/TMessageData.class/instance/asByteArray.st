read/write
asByteArray
	"Convert me into a datagram"
	| strm |
	strm := WriteStream on: (ByteArray new: arguments size + 64).
	self writeOn: strm.
	^strm contents