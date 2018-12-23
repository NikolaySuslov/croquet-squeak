private
logEntry: aLogEntry formatted: aLogFormatter
	"Produce a standard message and send it using UDP to all registered hosts. ignores the formatter for now"

	| message d dd |
		d := aLogEntry stamp dayOfMonth.
		dd := d < 10 ifTrue: [' ', d asString] ifFalse: [d asString].
		message := String new writeStream
			 << $< << (facility + aLogEntry numericLevel) asString << $> << aLogEntry stamp monthAbbreviation << ' ' << dd << ' '.
		 
		aLogEntry stamp asTime print24: true on: message.
		message << ' ' << self hostName << '[' << aLogEntry pid << '] ' << aLogEntry level << '(' << aLogEntry numericLevel << '): '.
		aLogEntry category ifNotNil: [ message <<  aLogEntry category asUppercase << ' ' ].
		message << aLogEntry line.
		aLogEntry sender ifNotNil: [ message << ' (' << aLogEntry sender asString << ')' ].

 		hosts do: [:host | self send: message to: host key port: host value]
 