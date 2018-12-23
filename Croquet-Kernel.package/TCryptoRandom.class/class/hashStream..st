secure hash
hashStream: aStream
	"This is an entry vector which we can use to dispatch to various hash algorithms"
	^self md5HashStream: aStream