accessing
pauseScript
	myProcess ifNotNil:[
		myProcess terminateScript.
		myProcess := nil.
	].
	super pauseScript.