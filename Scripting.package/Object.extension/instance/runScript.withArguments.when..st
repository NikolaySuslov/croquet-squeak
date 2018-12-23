*Scripting-Extensions
runScript: aScriptDescriptor withArguments: args when: aTrigger
"Evaluate the given script whenever the trigger becomes active. The script will be run in the context of the current island. The script will run in the calling process, and will finish before the calling #signal: method returns. Unlike #startScript:, #runScript: does not need a ScriptScheduler running in order to work correctly"

	| script spec |
	script := aScriptDescriptor asScriptMessageIn: self arguments: args.
	self privateAddScript: script.
	aTrigger ifNil:[^script valueWithEvent: nil].
	spec := aTrigger asEventSpecificationIn: self.
	spec ifNil:[^script valueWithEvent: nil].
	1 to: spec size by: 2 do:[:i|
		(spec at: i) on: (spec at: i+1) notify: script.
	].
	script eventSpec: spec.
	^script