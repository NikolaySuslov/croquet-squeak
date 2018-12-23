statistics
addToStatistics: msg
	"Take stats for the given message"
	| startTime latency |
	messageStats add: msg selector.
	startTime := sentMessages removeKey: msg sid ifAbsent:[^nil].
	latency := RealTime millisecondClockValue - startTime.
	latencyStats add: latency.
