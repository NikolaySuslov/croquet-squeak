tracing
valueWithEvent: anEvent
	"This initiates a new trace action"
	| script |
	script := Processor activeProcess.
	script eventTracer: self.
	script traceEvents: true.
	self traceEvent: anEvent message: (MessageSend receiver: traceTarget selector: traceEvent) script: Processor activeProcess from: nil.