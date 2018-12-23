reading
readObjectFrom: aStream
	| versionID data roots |
	Cursor read showWhile:[
		versionID := UUID nilUUID.
		aStream next: 16 into: versionID.
		(versionID = self class archiveVersionID) 
			ifFalse:[^self error: 'Not a project file'].
		archive := ZipArchive new.
		archive readFrom: aStream.
		data := (archive memberNamed: 'object.isg') byteStream contents.
		dataStream := IslandStream with: data.
		dataStream reset.
		(dataStream nextUUID = self class objectVersionID) 
			ifFalse:[^self error: 'Not a croquet file'].
		imports := self importNext.
		segment := self importNext.
	].
	progressBar ifNotNil:[progressBar value: defaultInfo].
	Cursor wait showWhile:[
		roots := self loadSegmentFrom: segment outPointers: imports.
	].
	^roots at: 1