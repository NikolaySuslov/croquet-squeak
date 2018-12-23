loader process
step
	"If it needs it, give the loader process a time slice to execute"

	self findCount > 0 ifTrue: [
		loaderDelay wait.
	].