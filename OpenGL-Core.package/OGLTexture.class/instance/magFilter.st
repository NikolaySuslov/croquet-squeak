accessing
magFilter
	^self parameters at: GLTextureMagFilter ifAbsent: [GLLinear]