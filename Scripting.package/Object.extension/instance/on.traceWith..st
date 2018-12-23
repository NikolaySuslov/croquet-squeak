*Scripting-Extensions
on: eventName traceWith: aTraceObserver
	"Start tracing events when the given event name is triggered.
	The provided trace observer will replace any existing trace observer for this event.
	If nil, the trace observer is removed."
	| map list |
	eventName ifNil:[^self].
	map := self myEventMap.
	map ifNil:[self myEventMap: (map := self newEventMap)].
	list := map at: eventName ifAbsentPut:[WeakArray new: 1].
	"tracer is always the first entry"
	(list at: 1) ifNil:[^list at: 1 put: aTraceObserver].
	(list at: 1) isEventTracer ifTrue:[^list at: 1 put: aTraceObserver].
	2 to: list size do:[:i|
		(list at: i) ifNil:[
			list at: i put: (list at: 1).
			^list at: 1 put: aTraceObserver].
	].
	map at: eventName put: (WeakArray with: aTraceObserver), list.
	^aTraceObserver
