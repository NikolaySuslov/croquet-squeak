*Scripting-Extensions
forEach: eventName do: aBlock until: stopCondition queueSize: queueSize
	"Evaluate the given block whenever eventName is triggered"
	| nArgs |
	(nArgs := aBlock numArgs) > 2 ifTrue:[^self error:'0-2 argument block expected'].
	^Processor activeProcess
		observe: {self. eventName}
		semaphore: nil 
		buffer: nil
		during:[:handler|
			[Processor activeProcess waitProcessOn: handler semaphore.
			self privateSendEvent: handler nextEvent to: aBlock args: nArgs.
			stopCondition value] whileFalse.
			nil]