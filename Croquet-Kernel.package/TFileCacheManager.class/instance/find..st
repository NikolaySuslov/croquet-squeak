searching
find: fileName
	"Find the file with the given resource id"
	| file data |
	mutex critical:[
		file := [self directory readOnlyFileNamed: fileName] on: Error do:[:ex| ex return: nil].
		file ifNotNil:[
			[file binary.
			data := file contents] ensure:[file close].
		].
	].
	^data