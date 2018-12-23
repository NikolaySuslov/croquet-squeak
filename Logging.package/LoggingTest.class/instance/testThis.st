as yet unclassified
testThis

"
self debug: #testThis.
"

	self x: 10 y: 20 pointName: 'corner'.
	
	self assertOutput: 'TEMP LOGGINGTEST LoggingTest-x: 10 y: 20 pointName: ''corner'' 
'.
