render
hasOpaque
	" Does this object have an opaque channel to render? Return true if it does."
	material ifNil:[^true].
	^material hasAlpha not