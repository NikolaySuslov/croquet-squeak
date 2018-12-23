export
exportInteger: anInteger
	"Export an integer"
	(anInteger class == SmallInteger) ifTrue:[
		dataStream nextPut: CodeSmallInteger.
		^dataStream nextInt32Put: anInteger.
	].
	anInteger positive ifTrue:[
		dataStream nextPut: CodeLargePositiveInteger.
		dataStream nextUInt32Put: anInteger size.
		dataStream nextPutAll: anInteger asByteArray.
	] ifFalse:[
		dataStream nextPut: CodeLargeNegativeInteger.
		dataStream nextUInt32Put: anInteger size.
		dataStream nextPutAll: anInteger asByteArray.
	].
