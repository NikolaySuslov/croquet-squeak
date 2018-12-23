*Scripting-Extensions
primitiveWaitUntil: eventName
	"Wait until an event with the given name is signaled."
	^Processor activeProcess
		observe: {self. eventName}
		semaphore: nil 
		buffer: nil
		during:[:handler|
			handler semaphore primitiveWait.
			handler nextEvent
		].