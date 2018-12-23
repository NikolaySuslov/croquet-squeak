initialize
destroy
	self stopUdpListener.
	self stopBroadcaster.
	udpSocket ifNotNil:[udpSocket destroy].
	udpSocket := nil.