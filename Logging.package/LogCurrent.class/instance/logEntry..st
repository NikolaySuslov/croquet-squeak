line-buffer
logEntry: aLogEntry

	self isIgnore ifTrue: [^ self].
	adapter logEntry: aLogEntry formatted: self formatter