library
saveImage
	"Save this guy"
	| type aForm fileName file writer |
	aForm := editor paintingForm ifNil:[^self].
	aForm colorCount <= 256 ifTrue:[type := '.gif'] ifFalse:[type := '.bmp'].
	fileName := 'Sketch'.
	[fileName := FillInTheBlankMorph request: 'Please enter the name' initialAnswer: fileName centerAt: window bounds center.
	fileName isEmptyOrNil ifTrue:[^self].
	[file := self libraryDirectory newFileNamed: fileName, type] 
		on: FileExistsException do:[:ex| ex return: nil].
	file == nil] whileTrue:[self inform: 'Error: ', fileName,' already exists'].

	[aForm := editor paintingForm.
	aForm colorAt: 0@0 put: Color transparent. "color key"
	type = '.gif' 
		ifTrue:[writer := GIFReadWriter]
		ifFalse:[writer := BMPReadWriter].
	writer putForm: aForm onStream: file.
	] ensure: file close.