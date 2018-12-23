searching
cache: data to: fileName
	"Find the file with the given resource id"
	| file |
	mutex critical:[
		file := [self directory forceNewFileNamed: fileName] on: Error do:[:ex| ex return: nil].
		file ifNotNil:[
			[file binary.
			file nextPutAll: data] ensure:[file close].
		].
	].
	^data