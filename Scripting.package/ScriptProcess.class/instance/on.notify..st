private-events
on: eventName notify: anObserver
	eventName == #waiting ifTrue:[flags := flags bitOr: FlagScriptSignalWait].
	eventName == #resuming ifTrue:[flags := flags bitOr: FlagScriptSignalResume].
	^super on: eventName notify: anObserver