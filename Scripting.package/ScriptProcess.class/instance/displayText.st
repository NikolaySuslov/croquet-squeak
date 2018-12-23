accessing
displayText
	^(String streamContents:[:s|
		"s nextPutAll: self event selector; space."
false ifTrue:[
		s nextPutAll: (self event sender printString contractTo: 50).
		s nextPutAll:'>>'.
		s nextPutAll: (self event selector).
] ifFalse:[
		s nextPutAll: (self owner receiver class printString contractTo: 50).
		s nextPutAll:'>>'.
		s nextPutAll: (self messageName ifNil:['???']).
].
	]).