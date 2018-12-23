public
ifActiveDo: aBlock
"Evaluate aBlock only if I would actually produce any output for the set level and category"

	self isIgnore ifTrue: [^ self].
	(adapter wouldLogEntry: self buildEntryHead) ifFalse: [^ self].
	aBlock valueWithPossibleArgument: self.
	stream position = 0 ifFalse: [self endEntry]