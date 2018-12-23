exporting
exportDataOn: byteStream classMap: classMap swapEnds: aBool
	byteStream nextUInt32Put: (classMap at: refClass).
	"Note: instShape/instSize is implicit in class map"
	byteStream nextUInt32Put: indexedSize.
	binary ifNotNil:[
		aBool ifTrue:[binary swapEndianness].
		binary class isBytes
			ifTrue:[byteStream nextPutAll: binary asByteArray]
			ifFalse:[byteStream storeWordsFrom: binary].
		aBool ifTrue:[binary swapEndianness].
		^self].
	1 to: data size do:[:i|
		(data at: i) exportReferenceOnIslandCopier: byteStream classMap: classMap.
	].