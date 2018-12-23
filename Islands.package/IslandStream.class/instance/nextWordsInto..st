accessing
nextWordsInto: wordArray
	| buffer max blt start width |
	(wordArray class isWords or:[wordArray byteSize = 4]) 
		ifFalse:[^super nextWordsInto: wordArray].

	max := wordArray basicSize*4.
	buffer := ByteArray new: (max min: 4096).
	blt := BitBlt toForm: (Form new hackRow: wordArray).
	blt sourceForm: (Form new hackRow: buffer).
	blt combinationRule: Form over.
	blt sourceX: 0; sourceY: 0; width: 0; height: 1.
	blt destX: 0; destY: 0.
	start := 0.
	[start < max] whileTrue:[
		width := (max - start) min: buffer size.
		self next: width into: buffer startingAt: 1.
		blt destX: start; width: width.
		blt copyBits.
		start := start + width
	].
	wordArray restoreEndianness. "swap if necessary"
	^wordArray