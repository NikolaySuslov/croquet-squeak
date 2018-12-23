setup
setUp
	"Create the dispatcher"
	super setUp.
	router := TExampleRouter new.
	router logStream: log.
	dispatcher := TExampleDispatcher new.
	dispatcher defaultRouterClass: TExampleRouter.
	dispatcher autoCreate: false.
	dispatcher addRouter: router id: self sessionID.
	dispatcher listenOn: TExampleController defaultPort.