udp listener
runUdpListener
	| buffer count address port cc |
	buffer := ByteArray new: 2048.
	[true] whileTrue:[
	
		udpSocket waitForData.
		"Note: The following is an oddity in the Squeak socket implementation. 
		The remote (peer) address/port will be set if a datagram has been received."
		mutex critical:[
			self halt.
			count := [udpSocket receiveSomeDataInto: buffer startingAt: 1]
				on: Error do:[:ex| ex return: -1].
			address := udpSocket remoteAddress.
			port := udpSocket remotePort.
		].
		count > 40 ifTrue:[
			(buffer copyFrom:1 to:4) asString = 'CRQT' ifTrue:[
				"Grab the port"
				port := buffer unsignedShortAt: 5 bigEndian: true.
				" is this one of mine?"
				(broadcastContacts findFirst:[:bc | bc port = port]) = 0 ifTrue:[ 
					cc := TContact new address: address buffer: buffer count: count.
					contactsByName at: cc name ifAbsentPut:[ cc ].
					contactsByID at: cc id ifAbsentPut:[ cc ].
				].
			].
		].
	].