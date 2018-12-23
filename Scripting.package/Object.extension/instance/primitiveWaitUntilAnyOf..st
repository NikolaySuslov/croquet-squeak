*Scripting-Extensions
primitiveWaitUntilAnyOf: eventSpec
	"Wait until any of the events in eventSpec are triggered."
	eventSpec size = 0 ifTrue:[^nil].
	^Processor activeProcess
		observe: eventSpec
		semaphore: Semaphore new 
		buffer: ScriptEventBuffer new
		during:[:handler|
			handler semaphore primitiveWait.
			handler nextEvent
		].