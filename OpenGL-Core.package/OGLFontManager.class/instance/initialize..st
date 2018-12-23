initialize
initialize: glX
	glx := glX.
	fonts := IdentityDictionary new.
	charList := ByteArray new: 256.