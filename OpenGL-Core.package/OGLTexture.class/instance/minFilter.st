accessing
minFilter
	^self parameters at: GLTextureMinFilter ifAbsent: [
		self bMipmap
			ifTrue: [GLLinearMipmapLinear]
			ifFalse: [GLLinear]]