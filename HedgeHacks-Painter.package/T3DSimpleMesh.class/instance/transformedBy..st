accessing
transformedBy: aMatrix
	"Return a copy of the receiver with its vertices transformed by the given matrix"
	| newFaces|
	newFaces := faces collect:[:face| face transformedBy: aMatrix].
	^self class withAll: newFaces