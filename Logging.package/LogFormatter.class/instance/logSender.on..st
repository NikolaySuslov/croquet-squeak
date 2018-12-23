text
logSender: aMessage on: aStream
	"handle blocks differently to avoid decompile in 'sender asString' "
	aMessage sender isBlock
		ifTrue: [aStream << $[  << aMessage sender method methodClass name
			<< '<<' <<  aMessage sender methodSelector << $]]
		ifFalse: [aStream << $( << aMessage sender asString << $)].	