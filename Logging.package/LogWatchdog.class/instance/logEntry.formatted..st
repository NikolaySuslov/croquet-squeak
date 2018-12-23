as yet unclassified
logEntry: aLogEntry formatted: aLogFormatter

	"why is SLLogWatchdog written class side?"

	"This method looks messy, and it is - but it is written to be as fast as possible."

	"Is this message over the threshold?"
	| message now |
	
	aLogEntry numericLevel <= Threshold
		ifTrue: [
			message := String new writeStream.
			message << aLogEntry stamp printString << ' [' << aLogEntry pid << '] - ' << aLogEntry level << '(', aLogEntry numericLevel << '): '.
			aLogEntry category ifNotNil: [ message << aLogEntry category asUppercase << ' ' ].
			message << aLogEntry line << ' (' << aLogEntry sender asString << ')'.
			Buffer
				ifNotNil: [
					"Add message to the buffer and possibly send it if the timer is out."
					self critical: [ 
						Buffer nextPutAll: message contents.
						now := DateAndTime now asSeconds.
						"Is the timer out? If so, send the buffer."
					 	now > Timer ifTrue: [ self sendBuffer]
					]
				]
				ifNil: [
					"No buffer to send nor add message to. Set the timer and send the message."
					Timer := DateAndTime now asSeconds + CollectMinutes.
					Buffer := String new writeStream.
					self sendMessage: message contents]]
		ifFalse: [
			"Ok, no message this time - do we have a buffer to send when the timer goes out?"
			Buffer ifNotNil: [
				now := DateAndTime now asSeconds.
				"Is the timer out? If so, if the buffer has content - send the buffer and reset Timer. Otherwise nil Buffer."
				now > Timer ifTrue: [
					Buffer isEmpty
						ifTrue: [Buffer := nil]
						ifFalse: [self sendBuffer]]]]