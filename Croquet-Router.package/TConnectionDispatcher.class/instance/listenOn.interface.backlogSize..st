initialize
listenOn: port interface: interface backlogSize: backlog
	"Start me on the given port/interface"
	socket := Socket newTCP.
	socket listenOn: port backlogSize: backlog.
	self startServer.