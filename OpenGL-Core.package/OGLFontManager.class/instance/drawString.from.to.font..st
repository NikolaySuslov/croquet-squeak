displaying
drawString: aString from: firstIndex to: lastIndex font: aFont
	| sz glFontID |
	glFontID := fonts at: aFont ifAbsentPut:[self uploadFont: aFont].
	glx glListBase: glFontID.
	sz := lastIndex - firstIndex + 1.
	sz > charList size ifTrue:[charList := ByteArray new: sz].
	charList replaceFrom: 1 to: sz with: aString startingAt: firstIndex.
	glx glCallLists: sz with: GLByte with: charList
