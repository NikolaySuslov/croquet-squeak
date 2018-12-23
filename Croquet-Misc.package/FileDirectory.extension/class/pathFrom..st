*Croquet-Misc
pathFrom: aCollection
	"Take the given collection and make it into a full path"
	"
		FileDirectory pathFrom: #('foo' 'bar' 'baz').
		FileDirectory pathFrom: {FileDirectory default pathName. 'mumble'. 'frobler'}.
	"
	| skipSeparator |
	^String streamContents:[:s|
		"Macs are special"
		(self pathNameDelimiter = $:
			and: [(aCollection first beginsWith: FileDirectory default pathName) not]) ifTrue: [
				s nextPutAll: FileDirectory default pathName.
				s nextPut: self pathNameDelimiter].

		aCollection do:[:pathPart|
			s nextPutAll: pathPart.
			skipSeparator := pathPart size = 0 or:[pathPart last = self pathNameDelimiter].
		] separatedBy:[
			skipSeparator ifFalse:[s nextPut: self pathNameDelimiter].
		].
	].
