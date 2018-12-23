importing
import: dataSet
	| indexedSize instSize inst instShape instClass remap |
	dataSet binary ifNotNil:[^dataSet binary].
	indexedSize := dataSet indexedSize.
	instShape := dataSet instShape.
	instClass := dataSet refClass.
	instSize := instShape size. 

	remap := shapeMap at: instClass ifAbsentPut:[instShape ~= instClass allInstVarNames].
	indexedSize = 0
		ifTrue:[inst := instClass basicNew]
		ifFalse:[inst := instClass basicNew: indexedSize].
	refMap at: dataSet put: inst.
	remap ifTrue:[
		self import: dataSet migratingTo: inst.
	] ifFalse:[
		1 to: instSize do:[:i|
			inst instVarAt: i put: (self remap: (dataSet at: i)).
		].
	].
	1 to: indexedSize do:[:i|
		inst basicAt: i put: (self remap: (dataSet at: instSize+i)).
	].
	^inst postImportFromIslandCopier: self