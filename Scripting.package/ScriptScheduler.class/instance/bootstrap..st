initialize
bootstrap: aBlock
	"Run aBlock in the context of this scheduler"
	| script |
	script := aBlock asAsyncScriptMessageIn: self arguments: #().
	script setScheduler: self.
	script := script valueWithEvent: ScriptEvent new.
	[script isDone] whileFalse:[self run].