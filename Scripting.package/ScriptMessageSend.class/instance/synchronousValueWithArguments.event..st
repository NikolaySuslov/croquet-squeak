evaluating
synchronousValueWithArguments: anArray event: anEvent
	"WARNING: The debugger knows about the existence of this method!"
	| result myScript |
	(myScript := Processor activeProcess) traceEvents 
		ifTrue:[myScript traceEvent: anEvent message: self script: nil].
	result := receiver perform: selector withArguments: anArray.
	eventSpec ifNil:[receiver privateRemoveScript: self].
	^result