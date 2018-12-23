*Scripting-Extensions
makeTicking: scriptDescriptor withArguments: args at: frequency
	"If no trigger is given, the script is evaluated exactly once"
	| script |
	script := self findScript: scriptDescriptor withArguments: args.
	(script == nil or:[script isTickingScript not]) ifTrue:[
		"Create a new script"
		script := scriptDescriptor asTickMessageIn: self arguments: args.
		script eventSpec: (Array with: self with: #ticking).
	] ifFalse:[
		script pauseScript.
	].
	script frequency: frequency.
	self privateAddScript: script.
	self signal: #scriptStatusChanged with: script selector.
	^script