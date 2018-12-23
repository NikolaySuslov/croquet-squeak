*Scripting-Extensions
waitUntilAnyOf: eventSpec timeout: milliseconds
	"Wait until any of the events in eventSpec are triggered, but return after the specified amount of milliseconds even if no event happened"
	| script delay |
	eventSpec size = 0 ifTrue:[^nil].
	^(script := Processor activeProcess)
		observe: eventSpec
		semaphore: Semaphore new 
		buffer: ScriptEventBuffer new
		during:[:handler|
			delay := Delay timeoutSemaphore: handler semaphore
				afterMSecs: (milliseconds max: 0).
			[script waitProcessOn: handler semaphore] ensure:[delay unschedule].
			handler nextEvent]