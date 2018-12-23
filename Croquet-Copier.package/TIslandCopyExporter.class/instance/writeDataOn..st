accessing
writeDataOn: file
	| stream classMap shapeString count |
	file binary.
	file nextPutAll: TIslandCopier version asByteArray.
	stream := GZipWriteStream on: file.

	"Write class names and shapes"
	classMap := IdentityDictionary new.
	self literalClasses do:[:cls| shapeMap at: cls put: #()].
	stream nextUInt32Put: shapeMap size.
	shapeMap keysAndValuesDo:[:cls :clsShape|
		stream nextUInt32Put: cls name size.
		stream nextPutAll: cls name asByteArray.
		shapeString := String streamContents:[:s|
			clsShape do:[:iv| s nextPutAll: iv] separatedBy:[s space].
		].
		stream nextUInt32Put: shapeString size.
		stream nextPutAll: shapeString asByteArray.
		classMap at: cls put: (classMap size+1).
	].
	"Store data"
	count := dataStream position.
	stream nextUInt32Put: count.
	dataStream position: 0.
	1 to: count do:[:i|
		dataStream next exportDataOn: stream classMap: classMap swapEnds: false.
	].

	stream close.
	^file contents