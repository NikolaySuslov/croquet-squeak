initialize
roots
	"Answer the roots for this island"
	| roots |
	self flag: #fixMe.
	"I don't quite understand why I have added the following GC but it does not work without it. I need to review it and either add a lengthy comment why we need it or (even better) add a comment explaining what needs to be fixed so we can get by withou it. There really doesn't seem to be much of a reason for it here."
	Smalltalk garbageCollect.
	roots := Array streamContents:[:s|
		s nextPut: self. "always myself first"
		exports do:[:each| s nextPut: each].
	].
	exports growTo: (Set sizeFor: roots size).
	^roots