accessing
at: key ifAbsent: aBlock 
	"Answer the value associated with the key or, if key isn't found,
	answer the result of evaluating aBlock."
	| element |
	mutex critical: [
		element := array at: (self findElementOrFlag: key).
		element == flag ifTrue:[^ aBlock value].
		].
	^element