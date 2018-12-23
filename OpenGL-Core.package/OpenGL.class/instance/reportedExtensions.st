extensions
reportedExtensions
	"answer a set of extension strings for this renderer"

	| rawExtensions |
	rawExtensions := (self glGetString: GLExtensions) fromCString.
	rawExtensions := rawExtensions findTokens: ' '.
	rawExtensions := rawExtensions collect:[:str| str asSymbol].
	^IdentitySet withAll: rawExtensions.
	