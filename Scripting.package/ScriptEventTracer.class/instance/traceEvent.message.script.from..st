tracing
traceEvent: anEvent message: aMessage script: aScript from: parentScript
	traceLog nextPut: (ScriptEventTraceEntry new
		event: anEvent message: aMessage script: aScript parent: parentScript).