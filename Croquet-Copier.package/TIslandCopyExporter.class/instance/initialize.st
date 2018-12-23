initialize
initialize
	refMap := IdentityDictionary new: 10000.
	shapeMap := IdentityDictionary new: 500.
	dataStream := ReadWriteStream on: (Array new: 1000).
	lvl := -1.
	byteSize := 0.