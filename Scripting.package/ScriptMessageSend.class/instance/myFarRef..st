accessing
myFarRef: farRef
	"Hang on to my far ref since the far ref might only be referenced weakly by a (far) event source and loosing the far ref means no events will reach us."
	myFarRef ifNotNil:[
		"This should really NEVER happen but it currently does due to a major bug in the island implementation. This needs fixing but for the interim period let's at least tell people that things are going wrong..."
		WorldState addDeferredUIMessage: (MessageSend receiver: Transcript selector: #show: argument: '\WARNING: Overriding farRef in ' withCRs, self printString).
	].
	myFarRef := farRef