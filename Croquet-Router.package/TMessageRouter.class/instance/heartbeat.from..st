actions
heartbeat: data from: aClient
	"aClient wants to receive heartbeat information."
	| facet tickRate |
	facet := (data copyFrom: 1 to: 16).
	tickRate := data unsignedLongAt: 17 bigEndian: true.
	aClient tickFacet: facet.
	aClient tickPeriod: tickRate.
	aClient startHeartbeat.
	self isProxy ifTrue: [upstream updateHeartbeat].