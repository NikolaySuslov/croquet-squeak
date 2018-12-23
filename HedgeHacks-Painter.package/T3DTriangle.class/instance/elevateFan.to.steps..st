elevation
elevateFan: vertices to: elevationVertex steps: nSteps
	"Elevate the given edge of a junction"
	| lastVtx nextVtx faces |
	faces := WriteStream on: #().
	lastVtx := nextVtx := nil.
	vertices reverseDo:[:pt|
		nextVtx := self elevateFrom: (pt@0) to: elevationVertex steps: nSteps.
		lastVtx ifNotNil:[self elevateConnect: lastVtx with: nextVtx into: faces].
		lastVtx := nextVtx.
	].
	^faces contents