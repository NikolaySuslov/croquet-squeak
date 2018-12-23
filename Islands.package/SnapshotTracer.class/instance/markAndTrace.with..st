searching
markAndTrace: obj with: aList
	| objClass child |
	objClass := obj class.

	"Trace class"
	child := objClass.
	(self isMarked: child) ifFalse:[
		parents at: child put: obj.
		aList add: child].

	objClass == SmallInteger ifTrue:[^false].

	objClass == CompiledMethod ifTrue:[
		"Special case for CompiledMethod"
		1 to: obj numLiterals do:[:i|
			child := obj literalAt: i.
			(self isMarked: child) ifFalse:[
				parents at: child put: obj.
				aList add: child]].
		^false].

	objClass isPointers ifFalse:[^false].

	1 to: objClass instSize do:[:i|
		child := obj instVarAt: i.
		(self isMarked: child) ifFalse:[
			parents at: child put: obj.
			aList add: child]].
	objClass isVariable ifFalse:[^false].
	objClass isWeak ifTrue:[^false].
	obj == outPointers ifTrue: [^false].
	1 to: obj basicSize do:[:i|
		child := obj basicAt: i.
		(self isMarked: child) ifFalse:[
			parents at: child put: obj.
			aList add: child]].
	^false