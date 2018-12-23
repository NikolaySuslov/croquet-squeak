evaluating
value
	| event eventList result coalesce |
	myQueue ifNil:[^nil].
	[self accessLock critical:[
		myQueue ifNil:[^nil].
		eventList := nil.
		"pull out all the events from the queue that can be coalesced and chain them 
		in reverse order to have the newest event at the head of the list"
		(event := myQueue firstOrNil) ifNotNil:[
			eventList := ScriptEventList new.
			eventList addFirst: myQueue removeFirst.
			coalesce := event coalesceEvents.
			coalesce ifTrue:["transfer all the events"
				[myQueue isEmpty] whileFalse:[eventList addFirst: myQueue removeFirst].
			].
		].
	].
	eventList == nil] whileFalse:[
		event := eventList first.
		result := [self synchronousValueWithEvent: event] 
			on: DropAllButLastEvent do:[:ex|
				myQueue isEmpty ifTrue:[ex resume]. "with old event"
				[myQueue isEmpty] whileFalse:[event := myQueue removeFirst].
				ex retry. "with new event"
		].
		coalesce ifTrue:[^result].
	].
	^nil