initialize
initialize
	super initialize.
	"asynchronous world loading can sometimes call for updating before this
	has been set to a boolean, unless we do so here."
	updating := false.