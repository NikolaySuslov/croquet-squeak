accessing
nextWordsPutAll: wordArray
	| buffer max blt start width |
	(wordArray class isWords or:[wordArray byteSize = 4]) 
		ifFalse:[^super nextWordsPutAll: wordArray].

	wordArray restoreEndianness. "swap if necessary"
	max := wordArray basicSize*4.
	buffer := ByteArray new: (max min: 4096).
	blt := BitBlt toForm: (Form new hackRow: buffer).
	blt sourceForm: (Form new hackRow: wordArray).
	blt combinationRule: Form over.
	blt sourceX: 0; sourceY: 0; width: 0; height: 1.
	blt destX: 0; destY: 0.
	start := 0.
	[start < max] whileTrue:[
		width := (max - start) min: buffer size.
		blt sourceX: start; width: width.
		blt copyBits.
		self next: width putAll: buffer.
		start := start + width
	].
	wordArray restoreEndianness. "swap if necessary"
