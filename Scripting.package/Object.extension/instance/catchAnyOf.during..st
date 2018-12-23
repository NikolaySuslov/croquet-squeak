*Scripting-Extensions
catchAnyOf: eventSpec during: aBlock
	"Catch any of the events in eventSpec during the evaluation of aBlock.
	DETAILS: All of the events triggered will be passed into the shared queue. If there are multiple events triggered, the last one will be passed upon return but any others (or older ones) are still accessible as dropped events."
	aBlock numArgs = 0 ifFalse:[^self error:'0 argument block expected'].
	eventSpec size = 0 ifTrue:[^aBlock value].
	^Processor activeProcess
		observe: eventSpec 
		semaphore: nil 
		buffer: ScriptEventBuffer new
		during:[:handler|
			aBlock value.
			handler nextEvent]