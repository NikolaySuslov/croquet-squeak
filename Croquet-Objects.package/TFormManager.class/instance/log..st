loading
log: aString
	false ifTrue:[
		WorldState addDeferredUIMessage: (MessageSend receiver: Transcript selector: #cr).
		WorldState addDeferredUIMessage: (MessageSend receiver: Transcript selector: #show: argument: aString).
	].
