exporting
exportObject: anObject
	"Export some generic object"
	| saved instSize indexedSize data instShape |
	saved := anObject objectToExportOnIslandCopier prepareToExportOnIslandCopier: self.
	lvl := lvl + 1.
	instShape := shapeMap at: saved class ifAbsentPut:[saved class allInstVarNames asArray].
	instSize := instShape size.
	indexedSize := saved basicSize.

	saved class isPointers ifTrue:[
		data := TIslandCopyData new: (instSize + indexedSize).
		byteSize := byteSize + (4+data basicSize * 4).
		data refClass: saved class.
		data instShape: instShape.
		data indexedSize: indexedSize.
		refMap at: anObject put: data.
		1 to: instSize do:[:i| data at: i put: (self remap: (saved instVarAt: i))].
		1 to: indexedSize do:[:i| data at: instSize+i put: (self remap: (saved basicAt: i))].
	] ifFalse:[
		data := TIslandCopyData new.
		byteSize := byteSize + (4 * 4).
		data refClass: saved class.
		data instShape: instShape.
		data indexedSize: indexedSize.
		data binary: saved.
		saved class isBytes 
			ifTrue:[byteSize := byteSize + saved basicSize]
			ifFalse:[byteSize := byteSize + (saved basicSize * 4)].
		refMap at: anObject put: data.
	].
	dataStream nextPut: data.
	data id: dataStream position.
	lvl := lvl - 1.
	^data