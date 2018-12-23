printing
wordStringOf: bits
	| str src dst |
	str := String new: bits basicSize * 4.
	src := Form new hackBits: bits.
	dst := Form new hackBits: str.
	src displayOn: dst.
	^str