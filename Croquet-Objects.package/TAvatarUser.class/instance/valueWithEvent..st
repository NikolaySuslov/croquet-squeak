private events
valueWithEvent: anEvent
	"Resignal an event from the replica"
	^self privateSignalEvent: (ScriptEvent new
		setSender: self selector: anEvent selector arguments: anEvent arguments
	)