streaming
valueWithEvent: event
	self isSuspended ifTrue:[^self].
	self buffer nextPut: event.
	semaphore signal.