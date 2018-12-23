plugins
testSqueakFFIPrims
	Smalltalk platformName = 'Win32'
		ifTrue:[^self externalPlugin: 'SqueakFFIPrims'].
	self eitherPlugin: 'SqueakFFIPrims'.