actions
tick: data from: aClient
	"Receive a broadcast message from aClient"
	| time |
	time := Float basicNew: 2.
	time basicAt: 1 put: (data unsignedLongAt: 1 bigEndian: true).
	time basicAt: 2 put: (data unsignedLongAt: 5 bigEndian: true).
	eventQueue nextPut: (MessageSend receiver: self selector: #advanceTo: argument: time).