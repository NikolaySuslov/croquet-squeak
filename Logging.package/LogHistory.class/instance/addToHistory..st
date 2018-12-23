as yet unclassified
addToHistory: aRecord

	mutex critical: [
		
		history at: next put: aRecord.
		next := (history size = next) ifTrue: [ 1 ] ifFalse: [ next + 1 ].
	
	]