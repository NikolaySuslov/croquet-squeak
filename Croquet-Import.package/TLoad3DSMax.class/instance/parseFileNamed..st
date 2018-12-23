parse
parseFileNamed: fName 

	"MessageTally spyOn: [self new parseFileNamed: (FileDirectory  
	pathFrom: {FileDirectory default pathName. 'Content'. 'Plateau'.  
	'HPdemo.ASE'})]"

	| fileStream string tree |

	"Caution: This was using CrLfFileStream, which is very slow,
      but the plain stream appears to work correctly and is much faster.
      This may cause issues with ASE files produced on other platforms,
	 although it is fine for all current demo material (6/20/2006)... bgf."

	fileStream := (StandardFileStream readOnlyFileNamed: fName) ascii.
	
	[string := fileStream next: fileStream size]
		ensure: [fileStream close].

	tree := self parse: string readStream.
	^tree.