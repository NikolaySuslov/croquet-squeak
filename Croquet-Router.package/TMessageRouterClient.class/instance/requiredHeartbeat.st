accessing
requiredHeartbeat
"Answer the heartbeat period that will satisfy my client's heartbeat request. Answers infinity if they don't need a heartbeat"

	^ tickPeriod ifNil: [Float infinity]