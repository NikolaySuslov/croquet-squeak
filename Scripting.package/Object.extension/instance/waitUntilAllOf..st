*Scripting-Extensions
waitUntilAllOf: eventSpec
	"Wait until all of the events in event spec are triggered.
	Return an array of events corresponding the event specification."
	| tempList anObject selector handler script |
	eventSpec size = 0 ifTrue:[^#()].
	"Since we need to have access to all the semaphores,
	create and remember each handler individually."
	script := Processor activeProcess.
	tempList := Array new: eventSpec size // 2.
	1 to: eventSpec size // 2 do:[:i|
		anObject := eventSpec at: 2*i-1.
		selector := eventSpec at: 2*i.
		tempList at: i put: (script observe: {anObject. selector}).
	].
	handler := tempList at: 1. "the outermost one"
	[
		tempList do:[:h| script waitProcessOn: h semaphore].
		1 to: tempList size do:[:i|
			tempList at: i put: (tempList at: i) nextEvent].
	] ensure:[
		script releaseObserver: handler.
	].
	^tempList