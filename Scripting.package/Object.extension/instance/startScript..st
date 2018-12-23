*Scripting-Extensions
startScript: scriptDescriptor
	"If no trigger is given, the script is evaluated exactly once"
	^self startScript: scriptDescriptor withArguments: #() when: nil