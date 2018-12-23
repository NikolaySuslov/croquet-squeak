function helpers
mapType: aString using: aDictionary
	| base |
	base := aString copyWithout: $*.
	^String streamContents: [:s |
		s nextPutAll: (aDictionary at: base ifAbsent: [self error: 'type not mapped: ', base]).
		s next: (aString occurrencesOf: $*) put: $*]
