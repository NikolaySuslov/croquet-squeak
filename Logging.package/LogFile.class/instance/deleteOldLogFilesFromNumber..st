private
deleteOldLogFilesFromNumber: toDelete

	| num dir fn |
	toDelete < 1 ifTrue: [^self].
	num := toDelete.
	dir := file directory.
	[fn := self class baseName, '.',num printString,'.', self class extension.
	dir fileExists: fn] whileTrue: [
		dir deleteFileNamed: fn.
		num := num - 1]