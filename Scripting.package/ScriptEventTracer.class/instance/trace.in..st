initialize
trace: eventName in: anObject
	traceLog := (ReadWriteStream on: (Array new: 100)).
	traceDonePosition := 0.
	traceEvent := eventName.
	traceTarget := anObject.
	traceTarget on: eventName traceWith: self.