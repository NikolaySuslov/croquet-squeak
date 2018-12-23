scheduling
run
	"Run all active scripts in the current time slot. An interesting bit of semantics here is that if the scheduler is run from within *another* scripting process its behavior is considered atomic. E.g., *no* script inside the caller will be run until we're done here."
	| priority process worker |
	"Prevent recursive calls to the scheduler."
	(process := Processor activeProcess) == activeScript 
		ifTrue:[^self error: 'Cannot drive myself'].

	process isScriptingProcess ifTrue:[
		"This process was driven by another scheduler. 
		To be atomic, we suspend that scheduler."
		process scheduler suspend. "g'night"

		"Also suspend the process itself and fork off a non-scripting
		process to drive the scheduler."
		worker := [
			self run.
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

	"Process pending active scripts"
	[
		[(activeScript := activeList firstOrNil) == nil]
			whileFalse:[self debugPrintActive. activeList signal].

	"Process synchronously waiting scripts in REVERSE order"
	syncList isEmpty] whileFalse:[syncList last transferTo: activeList].

	schedulerProcess ifNotNil:[schedulerProcess priority: priority].
	schedulerProcess := nil.