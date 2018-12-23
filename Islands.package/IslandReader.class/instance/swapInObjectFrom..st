reading
swapInObjectFrom: aStream
	| roots data |
	data := ByteArray new: aStream size.
	aStream next: data size into: data startingAt: 1.
	dataStream := IslandStream with: data.
	dataStream reset.
	(dataStream nextUUID = self class objectVersionID) 
		ifFalse:[^self error: 'Not a croquet file'].
	imports := self importNext.
	segment := self importNext.
	roots := self loadSegmentFrom: segment outPointers: imports.
	^roots at: 1