as yet unclassified
logEntry: aLogEntry formatted: aLogFormatter

	filter ifNotNil: [(filter value: aLogEntry) ifFalse: [^ self]].

	self do: [ :ea | 
		ea value ifNotNilDo: [ :log | 
			log logEntry: aLogEntry formatted: aLogFormatter
		]
	]