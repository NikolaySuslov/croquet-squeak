*Scripting-Extensions
startScript: scriptDescriptor withArguments: args
	"If no trigger is given, the script is evaluated exactly once"
	^self startScript: scriptDescriptor withArguments: args when: nil