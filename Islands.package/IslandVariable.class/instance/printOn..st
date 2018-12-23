printing
printOn: aStream
	"Print as home::key -> value"
	home ifNotNil:[aStream nextPutAll: home name].
	aStream nextPutAll: '::'; nextPutAll: key.
	aStream nextPutAll: ' -> '.
	aStream print: value.