importing
importStream: aStream
	| unzip count classes shapes sz string data swapEnds |
	swapEnds := self checkVersion: aStream.
	unzip := GZipReadStream on: aStream.
	"Read class names and shapes"
	count := unzip nextUInt32.
	classes := Array new: count.
	shapes := Array new: count.
	1 to: count do:[:i|
		sz := unzip nextUInt32.
		string := (unzip next: sz) asString asSymbol.
		classes at: i put: (Smalltalk at: string).
		sz := unzip nextUInt32.
		string := (unzip next: sz) asString.
		shapes at: i put: (Scanner new scanFieldNames: string).
	].
	"read data"
	count := unzip nextUInt32.
	data := Array new: count.
	1 to: count do:[:i| data at: i put: TIslandCopyData new].
	1 to: count do:[:i|
		(data at: i) importDataFrom: unzip classMap: classes shapeMap: shapes refMap: data swapEnds: swapEnds.
	].
	^self import: data last