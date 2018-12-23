exporting
importDataFrom: byteStream classMap: classMap shapeMap: shapeMap refMap: refMap swapEnds: swapEnds
	| classID obj refID |
	classID := byteStream nextUInt32.
	refClass := classMap at: classID.

	instShape := shapeMap at: classID.
	indexedSize := byteStream nextUInt32.
	refClass isPointers ifFalse:[
		"binary blurb of data"
		binary := refClass basicNew: indexedSize.
		refClass isBytes 
			ifTrue:[byteStream nextBytesInto: binary]
			ifFalse:[byteStream readWordsInto: binary].
		swapEnds ifTrue:[binary swapEndianness].
		^self].
	"non-binary data (pointers)"
	data := Array new: (instShape size + indexedSize).
	1 to: data size do:[:i|
		refID := byteStream nextUInt32.
		refID = 0 ifTrue:[
			classID := byteStream nextUInt32.
			obj := (classMap at: classID) decodeFromIslandCopierStream: byteStream.
		] ifFalse:[
			obj := refMap at: refID.
		].
		data at: i put: obj.
	].