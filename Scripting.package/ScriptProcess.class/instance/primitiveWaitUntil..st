synchronization
primitiveWaitUntil: eventName
	(eventName == #started and:[self isStarted]) ifTrue:[^self].
	(eventName == #done and:[self isDone]) ifTrue:[^self].
	^super primitiveWaitUntil: eventName.