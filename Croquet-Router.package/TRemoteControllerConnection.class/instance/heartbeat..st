actions
heartbeat: tickPeriod
	"HEARTBEAT: Request period update information from the router"
	| tickFacet heartbeatFacet tickData |
	heartbeat := tickPeriod.
	self flag: #mtf. "implement turning off the heartbeat"
	tickPeriod = Float infinity ifTrue: [^ self].

	"--Check to be sure we have the facet...if not we probably don't have permissions
		to use this function, so just exit silently. Maybe we should throw a permissions
		exception?"
	heartbeatFacet := facets at: #heartbeat ifAbsent: [^self].
	heartbeatFacet isZero
		ifTrue: [ ^self ].
	"Revoke the prior tick facet"
	self flag: #mtf. "This facet is revoked too early. We may receive a tick between now and when the new heartbeat starts. Need a heartbeat reply message and revoke on promise completion"
	tickFacet := facets at: #tick ifAbsent:[nil].
	tickFacet ifNil:[
		"Create a new #tick facet"
		tickFacet := self addMessageFacet: 
			(controller messageFacetNamed: #tick:from:).
		facets at: #tick put: tickFacet].
	tickData := ByteArray new: 4.
	tickData unsignedLongAt: 1 put: tickPeriod bigEndian: true.
	outQueue nextPut: (TDatagram facet: heartbeatFacet data: tickFacet, tickData).