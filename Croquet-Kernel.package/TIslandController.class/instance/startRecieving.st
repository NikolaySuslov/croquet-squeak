initialize
startRecieving
"Start recieving messages on this connection using the recommended settings"

	| p |
	p := self join.			"receive messages"
	p wait. "see above"
	self heartbeat: 20.
	self beServer.	"act as server"