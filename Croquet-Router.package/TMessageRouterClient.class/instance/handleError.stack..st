initialize
handleError: exception stack: longStack
	router logError: exception from: self stack: longStack.
	super handleError: exception stack: longStack.