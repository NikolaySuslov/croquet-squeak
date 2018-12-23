file creation
fileNamed: fileName
	| existingStream fullName |
	fullName := fileName asVmPathName.
	existingStream := Registry keys
		detect: [:file | file name sameAs: fullName]
		ifNone: [^ super fileNamed: fileName].
	(existingStream isKindOf: self) ifTrue: [^ existingStream].
	"If we reach here, the file  is already opened by an unsynchronized file stream. I'd throw an error, but the superclass method does not"
	^ nil