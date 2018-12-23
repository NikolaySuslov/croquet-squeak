actions
serve: data from: aClient
	"Serve snapshot data to/for aClient"
	"@@@@ TODO: This is a very simple variant which indirects through the router to serve the data. It is probably better to connect client and server directly since this avoids having the router in the middle. On the other hand, it's nice to see the machines so completely decoupled; a participant cannot even tell where he's getting the data from, and the server can't tell who he's serving the data to."
	| facet snapshot resID |
	self assert: [self isServer or: [self isProxy]].
	self isServer ifFalse: [^ downstream serve: data from: aClient].

	"get the response facet to invoke"
	facet := data copyFrom: 1 to: 16.
	resID := data copyFrom: 17 to: data size.
	snapshot := self snapshotOrResourceAt: resID.
	snapshot ifNil:[^nil].

	"send snapshot back to router"
	aClient outQueue nextPut:(TDatagram facet: facet data: snapshot).

	"and send a dummy message so that the other guy can play catch up"
	island future yourself.