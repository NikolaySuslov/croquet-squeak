heartbeat
startHeartbeat
	"Start the heart beat process"
	self stopHeartbeat.
	heartbeat := self fork: #runHeartbeat at: Processor userSchedulingPriority + 1.