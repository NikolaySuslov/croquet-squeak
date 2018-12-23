testing
testFilter: aMessage
	| lowerString cleanString |
	lowerString := aMessage value value asLowercase.
	^(self searchString asString substrings allSatisfy: [:sub |
		cleanString := (sub asLowercase) replaceAll: $_ with: (Character space).
		((cleanString first = $-) and: [(lowerString includesSubString: cleanString allButFirst) not]) or:
		[(cleanString first = $+) and: [lowerString includesSubString: cleanString allButFirst]] or:
		[lowerString includesSubString: cleanString]])