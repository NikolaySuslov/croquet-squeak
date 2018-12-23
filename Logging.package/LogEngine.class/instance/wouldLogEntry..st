as yet unclassified
wouldLogEntry: aLogEntry
	filter ifNil: [^ true].
	^ filter value: aLogEntry