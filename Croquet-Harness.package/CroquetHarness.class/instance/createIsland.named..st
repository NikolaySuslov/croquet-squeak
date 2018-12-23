initialize
createIsland: islandClass named: aString
	"Create a new island. islandClass must be a class that is used to generate the contents of the TIsland. aString is a name for the router/island that allows another user to identify it. aBlock is executed upon completion and existence of the island. This is used to do additional setup with the island."
	| p router controller id|
	id := islandClass islandID.

	"if a controller for this island has already been registered, just use that"
	allowControllerAliasing ifTrue:[
		controller := controllers detect:[:cc| cc sessionID = id and:[cc island == nil]] ifNone:[nil].
		controller ifNotNil:[^self createIsland: islandClass named: aString using: controller].
	].

	"Create the dispatcher for any local islands we'd like to host the router for"
	dispatcher ifNil:[
		dispatcher := TExampleDispatcher new.
		dispatcher listenOn: 0. "wildcard port"
		dispatcher autoCreate: false.
	].
	"@@@@ FIXME: This is clearly not the way to do it @@@@"
	router := TSimpleRouter new.
	false ifTrue:[router log: Transcript].
	router addUserName: 'foo' password: 'bar'.
	dispatcher addRouter: router id: id.
	
	contactPoint ifNil:[
		contactPoint := TContactPointWS new.
		contactPoint hostName: self class defaultBroadcaster.
		contactPoint start.
		].
	
	contactPoint addBroadcast:(TContact new 
		address: (NetNameResolver addressForName: self class dispatcherAddress) "dispatcher address" 		port: dispatcher port 
		id: id name: aString).

	"Create the controller"
	controller := TSimpleController new.
	controller connectTo: dispatcher address port: dispatcher port sessionID: id.
	self addController: controller.
	p := controller login: 'foo' password: 'bar'.
	p wait. "not good style but easier for the setup"
	p := controller join.			"receive messages"
	p wait. "see above"
	controller backDoor: (dispatcher routers at: id).
	^self createIsland: islandClass named: aString using: controller