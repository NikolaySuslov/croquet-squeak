initialize
initialize
	activeList := Semaphore new.
	syncList := Semaphore new.
	scheduledList := nil.
	pending := false.
	suspended := false.
	interruptProtect := Semaphore forMutualExclusion.
	myTickEvent := ScriptTickEvent new setSender: self selector: #tick arguments: {0. 0}.
	myEventMap := nil.
	tickTime := Time millisecondClockValue.
	tickList := Semaphore new.
