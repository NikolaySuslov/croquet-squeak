*Scripting-Extensions
startTicking: scriptDescriptor withArguments: args at: frequency
	"If no trigger is given, the script is evaluated exactly once"
	| script |
	script := self makeTicking: scriptDescriptor withArguments: args at: frequency.
	script resumeScript.
	self signal: #scriptStatusChanged with: script selector.
	^script