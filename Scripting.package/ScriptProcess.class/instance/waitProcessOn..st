synchronization
waitProcessOn: aWaitable
	"Wait on the given waitable object (Semaphore or Delay).
	Resynchronize with the scheduler when the wait completed."
	self == Processor activeProcess ifFalse:[^self error:'Not the active process'].
	self beginWait.
	aWaitable primitiveWait.
	"Note: It is not necessary to yield here - scripts are :=always:= synchronized so either the wait completed synchronuously in which case it will continue anyways. If not, then the following the scheduler wait will solve the problem for us."
	"Resynchronize the receiver with the scheduler."
	(self isActiveScript)
		ifFalse:[scheduler activeList primitiveWait].
	"Note: The reason for not resynchronizing when we're the active script is so that certain 'atomic' notions can be preserved. E.g., when we enter a signaled semaphore, the script should :=not:= be rescheduled at the end of the scheduler since the meaning of entering a signaled semaphore is non-preemptive."
	self endWait.
	^nil