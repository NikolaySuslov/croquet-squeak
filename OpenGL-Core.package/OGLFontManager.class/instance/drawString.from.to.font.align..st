displaying
drawString: aString from: firstIndex to: lastIndex font: aFont align: aSymbol
	| sz glFontID rect offset |
	glFontID := fonts at: aFont ifAbsentPut:[self uploadFont: aFont].
	glx glListBase: glFontID.
	sz := lastIndex - firstIndex + 1.
	aSymbol ifNotNil:[
		rect := 0@0 extent: (aFont widthOfString: aString) @ aFont height.
		offset := (rect perform: aSymbol).
		glx glBitmap: 0 with: 0 with: 0 with: 0
			with: 0 - offset x
			with: offset y - aFont height
			with: nil.
	].
	sz > charList size ifTrue:[charList := ByteArray new: sz].
	charList replaceFrom: 1 to: sz with: aString startingAt: firstIndex.
	glx glCallLists: sz with: GLByte with: charList
