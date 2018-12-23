private-events
removeEvent: eventName map: eventMap
	super removeEvent: eventName map: eventMap.
	(eventName == #waiting) 
		ifTrue:[flags := flags bitClear: FlagScriptSignalWait].
	(eventName == #resuming) 
		ifTrue:[flags := flags bitClear: FlagScriptSignalResume].