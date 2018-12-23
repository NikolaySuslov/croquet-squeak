streaming
nextEvent
	semaphore initSignals.
	^buffer ifNotNil:[buffer next]