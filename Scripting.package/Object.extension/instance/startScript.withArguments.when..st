*Scripting-Extensions
startScript: aScriptDescriptor withArguments: args when: aTrigger
"Evaluate the given script whenever the trigger becomes active. The script will be run in the context of the current island. If it is triggered by #signal: (the normal case) it will be started in a new process under the controll of the current ScriptScheduler. If triggered by #synchronousSignal:, it will run in the calling process, like a script created by #runScript:.. If running in the absence of a ScriptScheduler, use #runScript: instead"

	| script spec |
	script := aScriptDescriptor asAsyncScriptMessageIn: self arguments: args.
	self privateAddScript: script.
	self signal: #scriptStatusChanged with: script selector.
	aTrigger ifNil:[^script valueWithEvent: ScriptNullEvent new].
	spec := aTrigger asEventSpecificationIn: self.
	spec ifNil:[^script valueWithEvent: ScriptNullEvent new].
	"Note: Normally, we should be able to just do a pauseScript/resumeScript here. 
	However, this would dump any existing event queue in the async scripts which
	may already contain events."
	1 to: spec size by: 2 do:[:i|
		(spec at: i) on: (spec at: i+1) notify: script.
	].
	script eventSpec size = 0
		ifTrue:[script eventSpec: spec]
		ifFalse:[script eventSpec: script eventSpec, spec].
	^script