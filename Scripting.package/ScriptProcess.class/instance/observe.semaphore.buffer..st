private-events
observe: eventSpec semaphore: aSemaphore buffer: aBuffer
	"Install a observer for each event specified in the event spec.
	If a semaphore and buffer are provided, use those.
	This method will return the outermost handler (that is the one created
	for the first event) so that it's easy for the sender to release an entire
	chain of handlers."	
	| sema anObject eventName handler topHandler |
	topHandler := nil.
	sema := aSemaphore ifNil:[Semaphore new].
	1 to: eventSpec size // 2 do:[:i|
		anObject := eventSpec at: 2*i-1.
		eventName := eventSpec at: 2*i.

		handler := ScriptEventObserver new.
		topHandler ifNil:[topHandler := handler].
		handler semaphore: sema.
		handler buffer: aBuffer.
"@@@ do we :=really:= need the object/eventName pair here??? @@@"
		handler signaler: anObject.
		handler selector: eventName.
		handler resumeSuspending: 
			(self nextEventHandlerFor: anObject selector: eventName).
		handler nextHandler: myHandler.
		myHandler := handler.
		anObject on: eventName notify: handler].
	^topHandler