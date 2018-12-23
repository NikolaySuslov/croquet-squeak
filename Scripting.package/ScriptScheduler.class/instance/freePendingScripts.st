scheduling
freePendingScripts
	"Free any pending scripts that have been asynchronously released"
	interruptProtect critical:[
		scheduledList := self removeLinksWithValue: nil from: scheduledList.
		pending := false].