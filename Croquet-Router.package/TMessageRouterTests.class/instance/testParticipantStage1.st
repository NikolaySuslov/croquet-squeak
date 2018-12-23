router tests
testParticipantStage1
	"Connect another participant to the master island"
	self testMasterStage3.
	router ifNotNil:[self assert: router clients size = 1].
	"Connect participant"
	participant := self newController.
	participant turnLoggingOn.
	participant 
		connectTo: NetNameResolver localHostAddress 
		port: dispatcher port
		sessionID: self sessionID.
	(Delay forMilliseconds: 200) wait. "give router time to complete"
	self assert: participant status == #connected. "but not ready yet!"
	router ifNotNil:[self assert: router clients size = 2].
