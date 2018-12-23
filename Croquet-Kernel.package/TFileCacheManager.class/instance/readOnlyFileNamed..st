searching
readOnlyFileNamed: fileName
	"Find the file with the given resource id"
	| file |
	mutex critical:[
		file := [self directory readOnlyFileNamed: fileName] on: Error do:[:ex| ex return: nil].
	].
	^file