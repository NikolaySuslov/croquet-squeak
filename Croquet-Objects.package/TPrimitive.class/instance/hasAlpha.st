render
hasAlpha
	" Does this object have an alpha channel to render? Return true if it does."
	material ifNil:[^false].
	^material hasAlpha