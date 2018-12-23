proxy
requiredHeartbeat
"Answer the heartbeat period that will satisfy the heartbeat requests of all my clients. Answers infinity if nobody needs a heartbeat"

	^ clients inject: Float infinity into: [:min :ea | min min: ea requiredHeartbeat]