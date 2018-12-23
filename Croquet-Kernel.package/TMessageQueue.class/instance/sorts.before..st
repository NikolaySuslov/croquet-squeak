comparing
sorts: msgA before: msgB
	msgA time = msgB time 
		ifFalse:[^msgA time < msgB time].
	msgA sequenceNumber = msgB sequenceNumber
		ifFalse:[^msgA sequenceNumber < msgB sequenceNumber].
	^self error: 'These messages run at the same time'