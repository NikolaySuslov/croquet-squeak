export
export: aConstructor as: anObject
	"export: aClass as: arrayOfAllAttributes where the class has an constructor method
		aClass>>importFromIslandReader: anObject "
	dataStream nextPut: CodeConstructor.
	self export: aConstructor.
	self export: anObject.