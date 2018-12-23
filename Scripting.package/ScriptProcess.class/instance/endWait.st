synchronization
endWait
	"Signal the ending of a wait cycle"
	| time |
	priority := priority - 1. "restore previous priority"
	(flags bitAnd: FlagScriptSignalResume) = 0 ifFalse:[
		time := Time millisecondClockValue.
		(flags bitAnd: FlagScriptSignalWait) = 0 ifFalse:[self setProperty: #startTime toValue: time].
		self signal: #resuming with: time].