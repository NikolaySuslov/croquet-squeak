private
printOutPointerAnalysis: outPointers on: aStream
	"Capture statistics about the IS and print the number of instances per class and space usage"
	| bag sorted |
	aStream nextPutAll:'Far refs:'.
	aStream cr; nextPutAll:'-----------'.
	outPointers do:[:each| each class == FarRef ifTrue:[
		aStream cr; nextPutAll: (each send: #class) name; space; print: each.
	]].

	aStream cr; nextPutAll:'Out pointers:'.
	aStream cr; nextPutAll:'---------------'.

	bag := Bag new.
	outPointers do:[:each| bag add: each class name].
	sorted := bag sortedElements asArray sort:[:a1 :a2|
		a1 value = a2 value ifTrue:[
			(a1 key endsWith: ' class') = (a2 key endsWith: ' class')
				ifTrue:[a1 key <= a2 key]
				ifFalse:[a2 key endsWith: ' class'].
		] ifFalse:[a1 value > a2 value]].
	sorted do:[:assoc|
		aStream cr; nextPutAll: assoc key; tab.
		aStream print: assoc value; nextPutAll: ' instances '.
	].
