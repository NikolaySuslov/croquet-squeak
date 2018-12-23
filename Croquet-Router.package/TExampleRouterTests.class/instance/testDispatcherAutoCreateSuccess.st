tests
testDispatcherAutoCreateSuccess
	"Make sure the example dispatcher does create new routers when asked"
	dispatcher autoCreate: true.
	self assert: dispatcher autoCreate.
	self assert: dispatcher routers size = 1.
	controller := TExampleController new.
	controller 
		connectTo: NetNameResolver localHostAddress 
		port: dispatcher port
		sessionID: (TObjectID for: 'Dispatch Test').
	(Delay forMilliseconds: 200) wait.
	self assert: controller status == #connected.
	self assert: dispatcher routers size = 2.