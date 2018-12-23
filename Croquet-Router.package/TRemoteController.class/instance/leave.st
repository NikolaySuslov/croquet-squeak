actions
leave
	"LEAVE: Request no more messages for this island."
	| facet |
	facet := facets at: #leave.
	connection outQueue nextPut: (TDatagram facet: facet data: #())