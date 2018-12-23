as yet unclassified
testAnnotated

"
self debug: #testAnnotated.
"

	self log info x: 10 y: 20 pointName: 'corner'.
	
	self assertOutput:'INFO LOGGINGTEST x: 10 y: 20 pointName: ''corner'' 
'.
	