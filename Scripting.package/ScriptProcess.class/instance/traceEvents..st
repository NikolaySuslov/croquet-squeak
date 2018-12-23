event trace
traceEvents: aBool
	flags := aBool ifTrue:[flags bitOr: FlagScriptTraceEvents] ifFalse:[flags bitClear: FlagScriptTraceEvents].