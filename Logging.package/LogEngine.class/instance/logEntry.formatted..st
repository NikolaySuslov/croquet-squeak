as yet unclassified
logEntry: aLogEntry formatted: aLogFormatter
"ignores formatter for now"
	
	| le levelSelector out |
 
	self class LogClient: [ :log | 
		
			le := log for: self id.
			
			levelSelector := aLogEntry level asMutator.
		
			out := String new writeStream << '[' << aLogEntry pid asString << '] ' << (aLogEntry category ifNil: ['']) << ' ' << aLogEntry line.
		
			le stamp: aLogEntry stamp.
			(le respondsTo: levelSelector) 
				ifTrue: [ le perform: levelSelector with: out contents ]
				ifFalse: [ le privateInfo: aLogEntry level asUppercase msg: out contents ].
	]
	
