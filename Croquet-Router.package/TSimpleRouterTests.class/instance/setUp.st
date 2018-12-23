setup
setUp
	"Create the dispatcher"
	super setUp.
	router := TSimpleRouter new.
	router logStream: log.
	router addUserName: self adminLogin password: self adminPassword.
	router addUserName: self memberLogin password: self memberPassword.
	router addUserName: self guestLogin password: self guestPassword.

	dispatcher := TExampleDispatcher new.
	dispatcher autoCreate: false.
	dispatcher defaultRouterClass: TSimpleRouter.
	dispatcher addRouter: router id: self sessionID.
	dispatcher listenOn: TSimpleController defaultPort.