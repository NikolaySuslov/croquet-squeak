streaming
nextPut: anEvent
	self buffer nextPut: anEvent.
	semaphore signal.