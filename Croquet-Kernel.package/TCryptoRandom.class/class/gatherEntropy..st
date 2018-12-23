entropy
gatherEntropy: aByteArray
	"Fill buffer's worth of data with entropy. Return true if a high-quality source of entropy has been used, false if we had to fall back to a low-quality source."
	<primitive: 'primitiveGatherEntropy' module: 'CroquetPlugin'>
	self default nextInto: aByteArray.
	^false