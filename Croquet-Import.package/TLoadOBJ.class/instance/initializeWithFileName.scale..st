initialize
initializeWithFileName: fileName scale: scl
	| fileStream |

	" Load the .obj file. "
	fileStream := (CrLfFileStream readOnlyFileNamed: fileName) ascii.
	scale := scl.

	[self parseStream: fileStream] ensure: [fileStream close].