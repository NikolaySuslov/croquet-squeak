class initialization
initialize
	"ScriptProcess initialize"
	FlagScriptStarted := 1.
	FlagScriptDone := 2.
	FlagScriptSignalWait := 4.
	FlagScriptSignalResume := 8.
	FlagScriptTraceEvents := 16.
	FlagScriptStopRequest := 32.
	
	(Process instVarNames includes: 'island') 
		ifFalse:[[Process addInstVarName: 'island'] on: Warning do:[:ex| ex resume]].
