as yet unclassified
testPrivateViolationNot
	"
	self debug: #testPrivateViolation
	"
 
	self log privateViolation.

 	self assert: (self output = '') 
    