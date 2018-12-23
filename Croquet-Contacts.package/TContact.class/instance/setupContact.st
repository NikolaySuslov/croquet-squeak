action
setupContact
	| p  |
	controller ifNotNil:[ ^ self ].
	controller := TSimpleController new.
	controller connectTo: address port: port sessionID: id.

	p := controller login: 'foo' password: 'bar'.
	p wait.
	p := controller join. 	"request messages"
	p wait.
	p := controller sync. 	"request replicated state"
	p wait.
	controller install: p result.	"install replicated state"

	controller heartbeat: 20. "set heartbeat rate"
