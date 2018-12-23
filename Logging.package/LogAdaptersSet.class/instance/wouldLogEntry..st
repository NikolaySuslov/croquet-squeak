as yet unclassified
wouldLogEntry: aLogEntry
	filter ifNotNil: [(filter value: aLogEntry) ifFalse: [^ false]].
	^ self anySatisfy: [:ea | ea wouldLogEntry: aLogEntry]