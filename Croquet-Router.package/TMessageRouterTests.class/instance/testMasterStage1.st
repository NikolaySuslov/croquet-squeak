router tests
testMasterStage1
	"Create a controller; connect to new router"
	controller := self newController.
	controller turnLoggingOn.
	controller 
		connectTo: NetNameResolver localHostAddress 
		port: dispatcher port
		sessionID: self sessionID.
	(Delay forMilliseconds: 200) wait. "give router time to complete"
	self assert: controller status == #connected. "but not ready yet!"