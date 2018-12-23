accessing
terminateScript
	Processor activeProcess == myProcess 
		ifTrue:[^self startScript: #terminateScript].
	super terminateScript.
	myProcess ifNotNil:[
		myProcess terminate.
		myProcess := nil].