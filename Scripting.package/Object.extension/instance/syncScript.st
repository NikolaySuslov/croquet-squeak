*Scripting-Extensions
syncScript
	"Sync the current script, e.g., suspend it until all pending scripts have completed"
	Processor activeProcess scheduler syncList primitiveWait.