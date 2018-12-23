accessing
nextInt32
	"Read a 32-bit signed integer from the next 4 bytes"
	^(self next: 4) longAt: 1 bigEndian: true