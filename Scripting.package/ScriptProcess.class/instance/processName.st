accessing
processName
	"For the process browser"
	^String streamContents:[:s|
		s nextPutAll: (self hash asString forceTo: 5 paddingStartWith: $ ).
		s nextPutAll:' ['.
		s nextPutAll: (self owner receiver printString contractTo: 50).
		s nextPutAll:'>>'.
		s nextPutAll: (self messageName ifNil:['???']).
		s nextPut:$].
	].