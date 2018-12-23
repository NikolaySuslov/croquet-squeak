text
logTextEntry: aMessage on: aStream
	
	self logDate: aMessage on: aStream.
	
	aStream << ' - ' << aMessage level << '(' << aMessage numericLevel << ')' << (aMessage category ifNil: ['']) << ': ' << aMessage line << ' '. 

	aMessage processDescription ifNotNil: [aStream << aMessage processDescription << ', '].
	self logSource: aMessage on: aStream.
	self logSender: aMessage on: aStream.
