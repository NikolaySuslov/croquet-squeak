private
newScript
	suspendedContext := [self privateRunMsg.
						   self suspend] asContext.
	flags := 0.
	priority := Processor initialScriptPriority.
	scheduler := Processor activeProcess scheduler.