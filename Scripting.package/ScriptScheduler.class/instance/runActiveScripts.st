scheduling
runActiveScripts
	"Run all active scripts in the current time slot. An interesting bit of semantics here is that if the scheduler is run from within *another* scripting process its behavior is considered atomic. E.g., *no* script inside the caller will be run until we're done here."
	| toTick priority process worker |
	"Prevent recursive calls to the scheduler.
	We need this since there are still callers of #doOneCycle"
	(process := Processor activeProcess) == activeScript ifTrue:[^self].

	process isScriptingProcess ifTrue:[
		"This process was driven by another scheduler. 
		To be atomic, we suspend that scheduler."
		process scheduler suspend. "g'night"

		"Also suspend the process itself and fork off a non-scripting
		process to drive the scheduler."
		worker := [
			self runActiveScripts.
			process scheduler resume. "g'mornin"
			process resume.
		] forkAt: Processor userSchedulingPriority.
		^[process suspend] ensure:[
			worker terminate.
			schedulerProcess := nil.
		].
	].
	schedulerProcess := Processor activeProcess.
	priority := schedulerProcess priority.
	schedulerProcess priority: Processor userSchedulingPriority.

	"If any scripts need to be released, release them now"
	pending ifTrue:[self freePendingScripts].

	"Prepare for the next cycle of processing scripts"
	tickTime := Time millisecondClockValue.
	myTickEvent setArguments: (Array with: tickTime).
	toTick := tickList.
	tickList := Semaphore new.

	"Process pending active scripts first. This is so the 'main' UI process can spawn the redraw and the event processing script which should be processed before any tickers."
	[(activeScript := activeList firstOrNil) == nil]
		whileFalse:[self debugPrintActive. activeList signal].

	"Process all intrinsic tickers; this is equivalent to sending the #tick for objects registered with the tick list."
	[(activeScript := toTick firstOrNil) == nil] 
		whileFalse:[self debugPrintActive. toTick signal].

	"But also signal #tick explicitly in case we have some additional dependents"
	self signalEvent: myTickEvent shallowCopy.
	["Process any scripts that may have started in the mean time"
	[(activeScript := activeList firstOrNil) == nil]
		whileFalse:[self debugPrintActive. activeList signal].

	"Process synchronously waiting scripts in REVERSE order"
	syncList isEmpty] whileFalse:[syncList last transferTo: activeList].

	schedulerProcess priority: priority.
	schedulerProcess := nil.