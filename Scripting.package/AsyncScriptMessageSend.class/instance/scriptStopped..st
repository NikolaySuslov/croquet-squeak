evaluating
scriptStopped: aScript
	aScript == myProcess ifTrue:[
		myProcess := nil.
		myQueue := nil.
		eventSpec ifNil:[self terminateScript].
	].