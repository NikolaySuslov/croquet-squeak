*Scripting-Extensions
startTicking: scriptDescriptor at: frequency
	"If no trigger is given, the script is evaluated exactly once"
	^self startTicking: scriptDescriptor withArguments: #() at: frequency