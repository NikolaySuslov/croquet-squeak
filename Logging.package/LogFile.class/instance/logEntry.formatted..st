log protocol
logEntry: aLogEntry formatted: aLogFormatter
		
	self critical: [[
		(self wouldLogEntry: aLogEntry) ifFalse: [ ^ self ].
	
		self writeLine: (String streamContents: [:stream |
			aLogEntry logFormatted: aLogFormatter on: stream]).

		"Rotate log file if max size is reached."
		file position > self class maxSize ifTrue: [self rotate]
	] on: Error do: ["if I can't write to the file, silently give up. Mostly this happens when starting up the image on a different computer than the log file was on"]]