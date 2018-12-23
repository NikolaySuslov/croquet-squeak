event handling
dropFile: aFile
	"Handle a file dropped via the OS"
	| form |
	form := Form fromBinaryStream: aFile.
	^self dropForm: form