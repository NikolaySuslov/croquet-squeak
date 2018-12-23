actions connection
requiredHeartbeat
"Answer the heartbeat period that will satisfy this controller's heartbeat request and that of any child controllers. Answers infinity if nobody needs a heartbeat"

	| requiredHeartbeat |
	requiredHeartbeat := heartbeat ifNil: [Float infinity].
	self isProxy ifFalse: [^ requiredHeartbeat].
	^ requiredHeartbeat min: downstream requiredHeartbeat