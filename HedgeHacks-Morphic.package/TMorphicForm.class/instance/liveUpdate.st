render
liveUpdate
	| host |
	myFarRef ifNil:[^nil].
	MorphHosts ifNil:[MorphHosts := Dictionary new].
	host := MorphHosts at: myFarRef ifAbsent:[
		"Trigger creation of host"
		MorphHosts at: myFarRef put: nil.
		WorldState addDeferredUIMessage:(MessageSend
			receiver: constructor receiver
			selector: constructor selector
			arguments: constructor arguments, {worldExtent. myFarRef}).
		nil].
	host ifNotNil:[
		"Update the world"
		WorldState addDeferredUIMessage: (MessageSend receiver: host selector: #update).
	].