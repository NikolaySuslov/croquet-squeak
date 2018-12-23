accessing
minFilter
	^bMipmap ifTrue:[GLLinearMipmapLinear] ifFalse:[GLLinear]