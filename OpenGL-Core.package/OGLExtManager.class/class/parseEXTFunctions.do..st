function helpers
parseEXTFunctions: list do: aBlock
	"Take a list of strings comprising open gl functions, and answer them converted into array."
	| s return function args i type param |
	list do: [:string|
		s := string readStream.
		return := (s upTo: Character space) withBlanksTrimmed.
		function := 'gl', (s upTo: $() withBlanksTrimmed.
		args := ((s upTo: $)) findTokens: $,) collect: [:arg | 
			i := arg findLast: [:c | (c isAlphaNumeric or: [c = $_]) not].
			type := arg copyFrom: 1 to: i.
			type := type copyReplaceAll: 'const' with: ''.
			type := type copyReplaceAll: ' *' with: '*'.
			param := arg copyFrom: i+1 to: arg size.
			Array with: type withBlanksTrimmed with: param withBlanksTrimmed].
		aBlock value: return value: function value: args.
	].
