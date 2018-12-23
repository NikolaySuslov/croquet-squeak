testing
isDone
	"Return true if no more events can be traced"
	| entry script |
	traceLog position = 0 ifTrue:[^false].
	traceDonePosition = traceLog size ifTrue:[^true].
	"See if any of the scripts found after traceDonePosition are still running"
	traceDonePosition = 0 ifTrue:[traceDonePosition := 1].
	traceLog position: traceDonePosition.
	[(entry := traceLog next) == nil] whileFalse:[
		script := entry script.
		(script notNil and:[script isDone]) ifFalse:[
			"Not yet finished"
			traceDonePosition := traceLog position.
			traceLog position: traceLog size.
		].
	].
	traceDonePosition := traceLog position.
	^true