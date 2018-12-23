writer
runWriterProcess
	| datagram done |
	done := false.
	[done] whileFalse:[
		datagram := outQueue next.
		[self sendDatagram: datagram] on: Error do:[:ex|
			eventQueue nextPut:(MessageSend 
				receiver: self 
				selector: #handleError:stack: 
				arguments: (Array with: ex with: ex signalerContext longStack)).
			done := true.
		].
	].