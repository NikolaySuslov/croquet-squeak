*Scripting-Extensions
runTicking: aMessage at: frequency
	"Run the given script ticking at the provided frequency"
	| delay script |
	script := Processor activeProcess.
	frequency < 1000 
		ifTrue:[delay := Delay forMilliseconds: (1000 / frequency) asInteger].
	[true] whileTrue:[
		"fire script"
		aMessage valueWithEvent: script scheduler tickEvent.
		"wait on delay"
		delay ifNotNil:[delay wait].
		self waitTick.
	].
