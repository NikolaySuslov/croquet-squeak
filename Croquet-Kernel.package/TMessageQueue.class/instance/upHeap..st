as yet unclassified
upHeap: anIndex
	"Check the heap upwards for correctness starting at anIndex.
	 Everything below anIndex is ok."
	| value k kDiv2 tmp |
	anIndex = 0 ifTrue:[^self].
	k := anIndex.
	value := array at: anIndex.
	[ (k > 1) and:[self sorts: value before: (tmp := array at: (kDiv2 := k bitShift: -1))] ] 
		whileTrue:[
			array at: k put: tmp.
			indexUpdateBlock ifNotNil: [ indexUpdateBlock value: value value: k ].
			k := kDiv2].
	array at: k put: value.
	indexUpdateBlock ifNotNil: [ indexUpdateBlock value: value value: k ]