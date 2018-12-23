actions connection
updateHeartbeat
	"HEARTBEAT: Request period update information from the router"
	| tickFacet heartbeatFacet tickData tickPeriod |
	tickPeriod := self requiredHeartbeat.
	tickPeriod = Float infinity ifTrue: [^ self].

	"--Check to be sure we have the facet...if not we probably don't have permissions
		to use this function, so just exit silently. Maybe we should throw a permissions
		exception?"
	heartbeatFacet := facets at: #heartbeat ifAbsent: [^self].
	heartbeatFacet isZero
		ifTrue: [ ^self ].
	"Revoke the prior tick facet"
	tickFacet := facets at: #tick ifAbsent:[nil].
	tickFacet ifNil:[
		"Create a new #tick facet"
		tickFacet := self addMessageFacet: #tick:from:.
		facets at: #tick put: tickFacet].
	tickData := ByteArray new: 4.
	tickData unsignedLongAt: 1 put: tickPeriod bigEndian: true.
	connection outQueue nextPut: (TDatagram facet: heartbeatFacet data: tickFacet, tickData).