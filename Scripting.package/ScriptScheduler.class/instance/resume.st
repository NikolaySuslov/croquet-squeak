initialize
resume
	"Suspend this scheduler"
	self suspended ifFalse:[^self].
	suspended := false.
	schedulerProcess ifNotNil:[schedulerProcess resume]
