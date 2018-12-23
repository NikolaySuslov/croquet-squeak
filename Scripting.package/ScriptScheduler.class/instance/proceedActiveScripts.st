scheduling
proceedActiveScripts
	"Proceed running all active scripts in the current time slot.
	NOTE: This is a hack we currently need in order to deal with layout changes accordingly."
	"Prevent recursive calls to the scheduler.
	We need this since there are still callers of #doOneCycle"
	Processor activeProcess == activeScript ifTrue:[^self].
	"If any scripts need to be released, release them now"
	pending ifTrue:[self freePendingScripts].

	["Process any pending scripts that may have started in the mean time"
	[(activeScript := activeList firstOrNil) == nil]
		whileFalse:[self debugPrintActive. activeList signal].
	"Process synchronously waiting scripts in REVERSE order"
	syncList isEmpty] whileFalse:[syncList last transferTo: activeList].
