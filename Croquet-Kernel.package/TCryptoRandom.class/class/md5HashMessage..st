md5
md5HashMessage: aStringOrByteArray
	"TCryptoRandom md5HashMessage: 'foo'"
	^ self md5HashStream: (ReadStream on: aStringOrByteArray asByteArray)
