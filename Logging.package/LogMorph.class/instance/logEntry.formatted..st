log protocol
logEntry: aLogEntry formatted: aLogFormatter
"ignore the formatter for now"

	| str |
	
	(self removedClasses includes: aLogEntry sender name) ifFalse: [
		str := String new writeStream.
		
		str << aLogEntry stamp asTime print24 << ' - '<< aLogEntry level << ' '<< (aLogEntry category ifNil: ['']) << ': ' << aLogEntry line.
		
		self critical: [
			self pauseResumeState ifFalse: [
				self messages add: (aLogEntry sender name)->(aLogEntry numericLevel->str contents).
				(self classes anySatisfy: [:any | any = aLogEntry sender name]) ifFalse: [
					classes add: (aLogEntry sender name ifNil: [aLogEntry sender printString]).
					self changed: #classes].
				self changed: #filteredEntrys
			] ifTrue: [
				self bufferedMessages add: (aLogEntry sender name)->(aLogEntry numericLevel->str contents)
			]
		]
	]