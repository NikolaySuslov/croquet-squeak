tests
testDispatcherAutoCreateFail
	"Make sure the example dispatcher does not create new routers unless asked"
	dispatcher autoCreate: false.
	self deny: dispatcher autoCreate.
	self assert: dispatcher routers size = 1.
	controller := TExampleController new.
	controller 
		connectTo: NetNameResolver localHostAddress 
		port: dispatcher port
		sessionID: (TObjectID for: 'Dispatch Test').
	(Delay forMilliseconds: 200) wait.
	self assert: controller status == #invalid.
	self assert: dispatcher routers size = 1.