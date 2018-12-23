scheduling
scheduleScript: aUserScript
	| link |
	aUserScript == Processor activeProcess
		ifFalse:[^self error:'Can only schedule the active script'].
	aUserScript isScheduled
		ifTrue:[self error:'This script is already scheduled'].
	aUserScript == activeScript ifFalse:[activeList primitiveWait].
	"now we're in sync with the scheduler"
	link := ScriptProcessLink weakOn: aUserScript.
	scheduledList := self addLink: link toList: scheduledList.
	self signal: #scheduleScript with: aUserScript.
	^link