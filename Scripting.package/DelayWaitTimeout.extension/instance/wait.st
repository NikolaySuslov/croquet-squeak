*Scripting-override
wait
	"Wait until either the semaphore is signaled or the delay times out"
	[self schedule.
	"Move the Tweak portion out of Semaphore>>wait, otherwise we might 
	be interrupted before primitiveWait and be left suspended in limbo."
	(process := Processor activeProcess) isSystemProcess
		ifFalse:[process beginWaitOn: delaySemaphore].
	"It is critical that the following has no suspension point so that
	the test and the wait primitive are atomic. In addition, if the delay
	is no longer being waited on while entering the way we know that it 
	is expired because the delay has already fired."
	beingWaitedOn 
		ifTrue:[delaySemaphore primitiveWait]
		ifFalse:[expired := true]] ensure:[
			process isSystemProcess ifFalse:[process endWaitOn: self].
			self unschedule.
	].
	^self isExpired
