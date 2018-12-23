*Scripting-override
wait
	"The active Process must receive a signal through the receiver 
	before proceeding. If no signal has been sent, the active Process will be 
	suspended until one is sent. Essential. See Object documentation 
	whatIsAPrimitive."
	| process |
	(process := Processor activeProcess) isSystemProcess
		ifTrue:[^self primitiveWait].
	process beginWaitOn: self.
	self primitiveWait.
	process endWaitOn: self.