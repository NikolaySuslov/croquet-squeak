printing
wordBitsOf: string as: wordClass
	| str src dst bits |
	str := Base64MimeConverter mimeDecode: string as: String.
	bits := wordClass new: (str size // 4).
	src := Form new hackBits: str.
	dst := Form new hackBits: bits.
	src displayOn: dst.
	^bits