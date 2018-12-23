*Scripting-Extensions
waitUntilAnyOf: eventSpec
	"Wait until any of the events in eventSpec are triggered."
	| script |
	eventSpec size = 0 ifTrue:[^nil].
	^(script := Processor activeProcess)
		observe: eventSpec
		semaphore: Semaphore new 
		buffer: ScriptEventBuffer new
		during:[:handler|
			script waitProcessOn: handler semaphore.
			handler nextEvent]