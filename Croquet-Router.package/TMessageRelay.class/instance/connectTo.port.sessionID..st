connecting
connectTo: hostName port: portNum sessionID: sessionID
	"Connect me to the router"
	| s |
	self address: hostName port: portNum.
	self connect.
	"If running via loopback failure can happen immediately so guard against it"
	(s := socket) ifNotNil:[s isConnected ifTrue:[
		self sendData: sessionID count: sessionID size.
	]].