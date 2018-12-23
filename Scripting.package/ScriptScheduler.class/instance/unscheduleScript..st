scheduling
unscheduleScript: aLink
	"May be called asynchronously, e.g., when explicitly terminating scripts
	from debugger etc. Need to make sure we don't interfere with
	scheduledLists activity"
	self signal: #unscheduleScript with: aLink process.
	interruptProtect critical:[
		pending := true.
		aLink process: nil.
	].