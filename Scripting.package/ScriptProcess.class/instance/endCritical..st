synchronization
endCritical: aSemaphore
	"Resume after leaving a critical section"
	self isDone ifTrue:[^self]. "don't resume during unwind"
	scheduler ifNil:[^self].
	(self isActiveScript)
		ifFalse:[scheduler activeList primitiveWait].
	self endWait.