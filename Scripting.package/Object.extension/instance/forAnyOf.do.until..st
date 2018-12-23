*Scripting-Extensions
forAnyOf: eventSpec do: aBlock until: stopCondition
	"Evaluate aBlock whenever any of the events in eventSpec is triggered.
	DETAILS: All of the events triggered will be passed into the shared queue. If there are multiple events triggered, the last one will be passed into the block but any others (or older ones) are still accessible as dropped events."
	| nArgs |
	(nArgs := aBlock numArgs) > 2 ifTrue:[^self error:'0-2 argument block expected'].
	eventSpec size = 0 ifTrue:[^nil].
	^Processor activeProcess
		observe: eventSpec
		semaphore: Semaphore new 
		buffer: ScriptEventBuffer new
		during:[:handler|
			[Processor activeProcess waitProcessOn: handler semaphore.
			self privateSendEvent: handler nextEvent to: aBlock args: nArgs.
			stopCondition value] whileFalse.
			nil].