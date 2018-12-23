as yet unclassified
testAcceptance1
	"
	self debug: #testAcceptance1
	"

 	self assert: (self acceptance = 'ERROR LOGGINGTEST test: 1 
TEMP LOGGINGTEST LoggingTest-acceptance
TEMP LOGGINGTEST test: 3 
TEMP MYOWN test: 4 
ERROR MYOWN test: 5 
')