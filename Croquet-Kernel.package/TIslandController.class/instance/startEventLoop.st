event loop
startEventLoop
	self stopEventLoop.
	eventLoop := self fork:  #runEventLoop at: Processor userSchedulingPriority + 1.