importing
importByteString
	| sz string |
	sz := dataStream nextUInt32.
	string := ByteString new: sz.
	string replaceFrom: 1 to: sz with: (dataStream next: sz) asString startingAt: 1.
	^string