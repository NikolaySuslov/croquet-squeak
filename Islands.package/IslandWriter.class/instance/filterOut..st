private
filterOut: out
	| wellKnown aClass |
	wellKnown := IdentitySet new.
	#(
		"Special references from the islands framework"
		FarRef TFarRef
		"Literals shared via compiled methods"
		String Symbol "for < 3.8"
		ByteString WideString ByteSymbol WideSymbol " >= 3.8"
		"Other objects we know how to deal with"
		Color TranslucentColor Point
		"CompiledMethod since contexts from scripts may refer to them"
		CompiledMethod
		"All font classes"
		AbstractFont LinedTTCFont TTCFontSet StrikeFontSet StrikeFont FixedFaceFont MultiTTCFont TTCFont
	) do:[:clsName|
		aClass := Smalltalk classNamed: clsName.
		aClass ifNotNil:[wellKnown add: aClass].
	].

	^out reject:[:each|
		(IslandArgumentCopier isPassByIdentity: each)
			or:[(splObjects includesKey: each)
			or:[(wellKnown includes: each class)
			or:[each class == Array and:[self filterArray: each using: wellKnown]]]]].
