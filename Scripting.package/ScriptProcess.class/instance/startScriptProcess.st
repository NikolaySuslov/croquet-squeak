initialize-release
startScriptProcess
	"Activate the receiver in the context of the (already provided) user script scheduler."
	scheduler ifNil:[self suspend].
	myLink := scheduler scheduleScript: self.
	"Note: From here on we are synchronized with the scheduler."
	flags := flags bitOr: FlagScriptStarted.
	self endWait.
	myEventMap ifNotNil:[self signal: #started].
