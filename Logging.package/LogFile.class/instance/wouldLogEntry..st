log protocol
wouldLogEntry: aLogEntry
	filter ifNil: [^ true].
	^ filter value: aLogEntry