*Scripting-Extensions
waitUntil: stopEvent forAnyOf: eventSpec do: aBlock
	"Evaluate aBlock for each of the events generated from event spec. Stop if stopEvent occurs in stopObject. See comment at the end for details."
	| sema nArgs script loopHandler |
	(nArgs := aBlock numArgs) > 2 ifTrue:[^self error:'0-2 argument block expected'].
	^(script := Processor activeProcess)
		observe: {self. stopEvent}
		semaphore: nil
		buffer: nil
		during:[:stopHandler|
			sema := stopHandler semaphore.
			loopHandler := script
				observe: eventSpec
				semaphore: sema 
				buffer: ScriptEventBuffer new.
			 [sema ifNotNil:[script waitProcessOn: sema]. "until something happens"
			stopHandler size = 0] whileTrue:
				[self privateSendEvent: loopHandler nextEvent to: aBlock args: nArgs].
			stopHandler nextEvent].
	"DETAILS: This method establishes two separate scopes to handle stop and loop events independently. An alternative way would be to use something like:
		self forAnyOf: {
			self. stopEvent.
			loopObject. loopEvent.
		} do:[:evt|
			evt selector == stopEvent
				ifTrue:[doStop := true]
				ifFalse:[aBlock value: evt].
		] until:[doStop]
	but this has some complicated implications when the block takes a long time to complete. In this case, the stop event could get lost (if too many loop events come in afterwards) and it would also increase the complexity for the case if any loop events come in after the stop event. The way it is done above avoids these problems completely."