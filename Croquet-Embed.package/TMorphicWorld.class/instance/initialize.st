initialize
initialize
	super initialize.
	updating := false. "Asynchronous loading could cause this to be referenced before otherwise set."