private
filterArray: array using: wellKnown
	^array allSatisfy:[:each|
		(IslandArgumentCopier isPassByIdentity: each)
			or:[(wellKnown includes: each class)
			or:[each class == Array and:[self filterArray: each using: wellKnown]]]].