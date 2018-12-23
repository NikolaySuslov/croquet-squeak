testing
shouldLogEntry: aLogEntry
	aLogEntry numericLevel <= maxNumericLevel ifFalse: [^ false].
	(categoryFilter allows: aLogEntry category) ifFalse: [^ false].
	^ true