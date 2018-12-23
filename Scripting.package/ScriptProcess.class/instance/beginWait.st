synchronization
beginWait
	"Signal the beginning of a wait cycle"
	| time started |
	"Boost this scripts priority for the wait. This is necessary in order to keep both, scripts newly triggered (forked) by an event and those waiting for some event in the right order (e.g., without the boost a waiting script may run :=after:= one that was 'created later' based on the same event)."
	priority := priority + 1.

	(flags bitAnd: FlagScriptSignalWait) = 0 ifFalse:[
		time := Time millisecondClockValue.
		(flags bitAnd: FlagScriptSignalResume) = 0 
			ifTrue:[started := time]
			ifFalse:[started := self valueOfProperty: #startTime ifAbsent:[time]].
		self signal: #waiting with: time with: (time - started)].
