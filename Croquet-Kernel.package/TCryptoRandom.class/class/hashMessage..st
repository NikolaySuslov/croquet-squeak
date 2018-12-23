secure hash
hashMessage: aStringOrByteArray
	"This is an entry vector which we can use to dispatch to various hash algorithms"
	^self md5HashMessage: aStringOrByteArray