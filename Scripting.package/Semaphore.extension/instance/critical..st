*Scripting-override
critical: mutuallyExcludedBlock			
	"Evaluate mutuallyExcludedBlock only if the receiver is not currently in
	the process of running the critical: message. If the receiver is, evaluate
	mutuallyExcludedBlock after the other critical: message is finished."
	| blockValue process caught |
	process := Processor activeProcess.
	process isSystemProcess ifFalse:[process beginCritical: self].

	caught := false.
	"The following works only correctly in combination with Process>>terminate."
	[
		caught := true. 
		self primitiveWait.
		blockValue := mutuallyExcludedBlock value
	] ensure: [
		caught ifTrue: [self signal].
		process isSystemProcess ifFalse:[process endCritical: self].
	].
	^blockValue
