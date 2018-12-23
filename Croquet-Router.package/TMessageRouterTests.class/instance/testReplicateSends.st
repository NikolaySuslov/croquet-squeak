router tests
testReplicateSends
	"Connect another participant to the master island"
	| original ref replica sync |
	<timeout: 10>

	self testParticipantStage2.

	"Replicate from controller to participant"
	original := 'Hello World'.
	ref := controller island future at: #hello put: original.
	ref wait.
	sync := participant island future yourself.
	sync wait.
	participant island send:[:obj| replica := obj at: #hello].
	self assert: replica = original.

	"Replicate from participant to controller"
	original := 'Testing, testing, one, two'.
	ref := participant island future at: #hello put: original.
	ref wait.
	sync := controller island future yourself.
	sync wait.
	controller island send:[:obj| replica := obj at: #hello].
	self assert: replica = original.
