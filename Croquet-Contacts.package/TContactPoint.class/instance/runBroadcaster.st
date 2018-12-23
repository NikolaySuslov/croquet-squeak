broadcaster
runBroadcaster
	| delay address |
	address := ByteArray with: 255 with: 255 with: 255 with: 255. "broadcast"
	delay := Delay forSeconds: 5.

	[true] whileTrue:[
		broadcastContacts do:[:bc |
			self sendPacket: bc buffer size: bc buffer size address: address port: DefaultPort.
		].
		delay wait.
	].