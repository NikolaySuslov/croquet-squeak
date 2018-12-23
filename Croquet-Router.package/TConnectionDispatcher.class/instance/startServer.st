server
startServer
	"Start the server process"
	self stopServer.
	server := self fork:  #runServer at: Processor lowIOPriority.