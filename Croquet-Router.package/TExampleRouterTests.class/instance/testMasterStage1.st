tests
testMasterStage1
	"Create a controller; connect to new router"
	super testMasterStage1.
	self assert: dispatcher routers size = 1.
	self assert: router clients size = 1.