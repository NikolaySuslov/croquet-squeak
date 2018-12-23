private
printSpaceAnalysisOn: aStream
	"Capture statistics about the IS and print the number of instances per class and space usage"
	| instCount instSpace sorted sum1 sum2 data |
	aStream cr; nextPutAll:'Space analysis:'.
	aStream cr; nextPutAll:'------------------'.
	data := self doSpaceAnalysis.
	instSpace := data last.
	instCount := data first.
	sorted := SortedCollection sortBlock:[:a1 :a2| a1 value >= a2 value].
	instSpace associationsDo:[:a| sorted add: a].
	sorted do:[:assoc|
		aStream cr; nextPutAll: assoc key; tab.
		aStream print: (instCount at: assoc key); nextPutAll:' instances '.
		aStream print: assoc value; nextPutAll: ' bytes '.
	].
	sum1 := instCount inject: 0 into:[:sum :n| sum + n].
	sum2 := instSpace inject: 0 into:[:sum :n| sum + n].
	aStream cr; cr.
	aStream print: sum1; nextPutAll:' instances '.
	aStream print: sum2; nextPutAll: ' bytes '.
