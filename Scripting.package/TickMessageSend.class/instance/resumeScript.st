accessing
resumeScript
	super resumeScript.
	myProcess ifNil:[
		myProcess := receiver startScript: #runTicking:at: withArguments:{self. frequency}.
		myProcess := myProcess message.
	].
	receiver signal: #scriptStatusChanged with: selector.