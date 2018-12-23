copying
clone: obj
	| newObj |
	CopyStats ifNotNil:[CopyStats add: obj class].
	obj class isPointers ifFalse:[^obj shallowCopy].
	newObj := obj shallowCopy.
	1 to: newObj class instSize do:[:i|
		newObj instVarAt: i put: (self pass: (obj instVarAt: i)).
	].
	1 to: newObj basicSize do:[:i|
		newObj basicAt: i put: (self pass: (obj basicAt: i)).
	].
	^newObj