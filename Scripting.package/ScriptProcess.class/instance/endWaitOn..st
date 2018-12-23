synchronization
endWaitOn: aSemaphore
	"Resynchronize the receiver with the scheduler."
	(self isActiveScript)
		ifFalse:[scheduler activeList primitiveWait].
	"Note: The reason for not resynchronizing when we're the active script is so that certain 'atomic' notions can be preserved. E.g., when we enter a signaled semaphore, the script should :=not:= be rescheduled at the end of the scheduler since the meaning of entering a signaled semaphore is non-preemptive."
	self endWait.
	^nil