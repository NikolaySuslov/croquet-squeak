waiting
waitTimeoutMSecs: msecs
	"Wait for at most the given number of milliseconds for this promise to resolve. Answer true if it is resolved, false otherwise."
	| sema |
	sema := Semaphore new.
	self whenComplete:[sema signal].
	Delay timeoutSemaphore: sema afterMSecs: msecs.
	^self isResolved