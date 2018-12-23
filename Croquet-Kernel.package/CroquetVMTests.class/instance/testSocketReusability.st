socket tests
testSocketReusability
	"Tests whether 'aSocket beReusable' works properly."
	| address port udp1 send1 udp2 recv2 sendProc recvProc received |
	address := ByteArray withAll: #(255 255 255 255). "broadcast"
	port := 31259.
	[
		udp1 := Socket newUDP.
		udp1 setOption: 'SO_REUSEADDR' value: 1.
		udp1 setOption: 'SO_REUSEPORT' value: 1.
		udp1 setPort: port.
		udp1 setOption: 'SO_BROADCAST' value: 1.
		send1 := TObjectID for: 'Send'.

		udp2 := Socket newUDP.
		udp2 setOption: 'SO_REUSEADDR' value: 1.
		udp2 setOption: 'SO_REUSEPORT' value: 1.
		udp2 setPort: port.
		udp2 setOption: 'SO_BROADCAST' value: 1.
		recv2 := TObjectID for: 'Recv'.

		received := 0.
		recvProc := [
			[received < 16] whileTrue:[
				received := received + (udp2 receiveDataInto: recv2 startingAt: received + 1).
			]
		] fork.
		sendProc := [
			udp1 setPeer: address port: port.
			udp1 sendData: send1 count: 16.
		] fork.
		(Delay forMilliseconds: 200) wait.
		self should: [recvProc isTerminated].
		self should: [sendProc isTerminated].
		self should: [send1 = recv2].
	] ensure:[
		udp1 destroy.
		udp2 destroy.
	].
