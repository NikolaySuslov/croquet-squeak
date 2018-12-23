parse
parseOldFileNamed: fName 
	"MessageTally spyOn: [self new parseOldFileNamed: 
	(FileDirectory pathFrom: {FileDirectory default pathName. 'Content'. 
	'Plateau'. 'HPdemo.ASE'})]
	"
	| fileStream string |
	fileStream := (CrLfFileStream readOnlyFileNamed: fName) ascii.
	[string := fileStream next: fileStream size]
		ensure: [fileStream close].
	stringLoc := 1.
	^ self parseOld: string