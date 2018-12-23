reader
receiveDataInto: aBuffer
	"Handled here since socket only provides partial data"
	| count |
	count := 0.
	[count < aBuffer size] whileTrue:[
		socket isConnected ifFalse:[ConnectionClosed signal:'Connection closed'].
		count := count + (socket receiveDataInto: aBuffer startingAt: count+1).
	].
	recvAmount := recvAmount + count.