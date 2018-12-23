as yet unclassified
testPrivateViolation 
	"
	self debug: #testPrivateViolation
	"

	self log adapter privateMethodFor: self.

 	self assert: (self output = 'WARN LOGTESTADAPTER PRIVATE VIOLATION
') 
    