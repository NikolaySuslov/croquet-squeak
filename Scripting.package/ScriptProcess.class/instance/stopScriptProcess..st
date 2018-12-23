initialize-release
stopScriptProcess: resultObj
	"Finish the receiver in the context of the user script scheduler."
	myLink ifNotNil:[scheduler unscheduleScript: myLink].
	myLink := nil.
	self beginWait.
	result := resultObj.
	flags := flags bitOr: FlagScriptDone.
	owner ifNotNil:[owner scriptStopped: self].
	myHandler ifNotNil:[myHandler releaseTo: nil].
	myEventMap ifNotNil:[self signal: #done with: resultObj].
