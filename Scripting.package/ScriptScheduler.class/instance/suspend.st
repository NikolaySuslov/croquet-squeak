initialize
suspend
	"Suspend this scheduler"
	schedulerProcess ifNil:[^self].
	schedulerProcess isSuspended ifTrue:[^self].
	schedulerProcess suspend.
	suspended := true.
