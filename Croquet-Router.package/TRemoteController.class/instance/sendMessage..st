actions connection
sendMessage: msg
	"SEND: Broadcast a message to all participants."

	| facet |
	status == #invalid ifTrue: [^self]..
	facet := facets at: #send ifAbsent:[nil].  
	facet
		ifNil:[
			log ifNotNil:[self log: 'WARNING: No send facet'].
			^nil
		].
	sentCounter := sentCounter + 1 \\ 16r3FFFFFFF.
	msg sender: senderID.
	msg sid: sentCounter.
	sentMessages size < 100
		ifTrue:[
			"Note: If we have more then 100 outstanding messages 
			there is really no point whatsoever in trying to measure latency"
			sentMessages at: sentCounter put: RealTime millisecondClockValue.
		].
	connection backDoor
		ifNil:[
			"the usual way"
			connection outQueue nextPut: (TDatagram facet: facet data: msg asByteArray).
		]
		ifNotNil:[
			"For optimization: Avoid an entire round-trip (encrypt, send, recv, decrypt)
			if we have a backDoor entry into the router."
			connection backDoor eventQueue
				nextPut: (
					MessageSend
						receiver: connection backDoor
						selector: #send:from:
						arguments: (Array with: msg asByteArray with: nil)
				).
		].
