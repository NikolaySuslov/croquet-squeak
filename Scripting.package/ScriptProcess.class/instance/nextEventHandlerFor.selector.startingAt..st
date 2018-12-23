private-events
nextEventHandlerFor: anObject selector: eventName startingAt: observer
	"Find an return the enclosing event handler scope for the object/event pair. This method should be really fast; right now we're just searching the entire chain (which is bad) - we need something that's fast for the innermost event handler."
	| next |
	next := observer.
	[next == nil] whileFalse:[
		(next signaler == anObject and:[next selector == eventName]) ifTrue:[^next].
		next := next nextHandler.
	].
	^nil