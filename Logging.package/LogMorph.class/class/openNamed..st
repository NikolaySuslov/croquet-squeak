as yet unclassified
openNamed: aName
	"Open in Morphic. Note that this does not register it
	as an emitter in any SLLog instance."

	"self open"

	^(self labelled: aName) open; yourself