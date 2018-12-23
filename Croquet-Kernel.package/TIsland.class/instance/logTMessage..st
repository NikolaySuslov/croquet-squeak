event loop
logTMessage: msg

	ShouldLog
		ifNotNil: [ self log:  (time printString , ' ' , (msg receiver class name) , ' ' , (msg selector)) ].
