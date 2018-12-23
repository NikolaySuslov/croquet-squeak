displaying
uploadFont: aFont
	| glFontID form |
	glFontID := glx glGenLists: 256.
	0 to: 255 do:[:i|
		form := aFont characterFormAt: (i asCharacter).
		form flipVertically.
		Smalltalk isLittleEndian ifTrue: [self swapBytesOf: form bits].
		glx glNewList: glFontID+i with: GLCompile.
		glx glBitmap: form width
			with: form height
			with: 0
			with: 0
			with: form width
			with: 0
			with: form bits.
		glx glEndList.
		form flipVertically.
		Smalltalk isLittleEndian ifTrue: [self swapBytesOf: form bits].
	].
	^glFontID