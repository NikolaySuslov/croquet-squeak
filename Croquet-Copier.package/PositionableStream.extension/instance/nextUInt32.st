*Croquet-Copier
nextUInt32
	"Read a 32-bit signed integer from the next 4 bytes"
	^(self next: 4) unsignedLongAt: 1 bigEndian: true