initialize
initialize
	super initialize.
	mutex := TMutex new.
	contactsByName := Dictionary new.
	contactsByID := Dictionary new.
	broadcastContacts := OrderedCollection new.
	udpSocket := Socket newUDP.
	udpSocket setOption: 'SO_REUSEADDR' value: 1.
	udpSocket setOption: 'SO_REUSEPORT' value: 1.
	udpSocket setPort: DefaultPort.   "magic listening port"
	udpSocket setOption: 'SO_BROADCAST' value: 1.
	self startUdpListener.
	self startBroadcaster.