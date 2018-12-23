as yet unclassified
log

	"we simulate the idea that a specific log adaptor is instanciated once per thread"
	
	^ (log ifNil: [ log := LogCurrent new adapter: LogTestAdapter new ])
		inSender: thisContext sender 
	
  