heartbeat
stopHeartbeat
	"Start the heart beat process"
	heartbeat ifNotNil:[heartbeat terminate].
	heartbeat := nil.
