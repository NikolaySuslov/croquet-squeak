initialize
terminate
	"Suspend this scheduler"
	schedulerProcess ifNotNil:[
		schedulerProcess terminate.
		schedulerProcess := nil.
	].
