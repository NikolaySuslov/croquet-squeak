connecting
connect
	"Connect to the router"
	socket := Socket newTCP.
	[socket connectTo: address port: port.
	socket waitForConnectionFor: 5] on: Error do:[:ex|
		socket destroy.
		socket := nil.
		ex return.
	].
	socket ifNil:[^false].
	socket isConnected ifFalse:[
		socket destroy.
		socket := nil.
		^false].
	"Disable TCP delays"
	socket setOption: 'TCP_NODELAY' value: true.
	self startUp.
	^true