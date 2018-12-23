scheduling
resumeScript: aUserScript
	"Resume the given user script"
	aUserScript == Processor activeProcess 
		ifTrue:[^self error:'Can only resume inactive scripts'].
	aUserScript setScheduler: self.
	aUserScript resume.