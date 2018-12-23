registry
lookup: aName ifAbsent: exceptionBlock
	| ref |
	ref := mutex critical:[nameMap at: aName ifAbsent:[nil]].
	ref ifNil:[^exceptionBlock value].
	^ref valueOn: self