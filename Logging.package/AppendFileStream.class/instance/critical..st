as yet unclassified
critical: aBlock
	mutex ifNil: [mutex := Mutex new]. "initialize is never called; do it here"
	mutex critical: [
		self ensureOpen.
		self setToEnd.
		aBlock value.
		"self flush."
	]