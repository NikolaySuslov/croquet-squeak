importing
importWideString
	| sz string |
	sz := dataStream nextUInt32.
	string := WideString new: sz.
	dataStream nextWordsInto: string.
	^string