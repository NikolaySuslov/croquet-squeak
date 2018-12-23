elevation
elevateSleeve: nSteps
	| lastEdge nextEdge faces lastEdgeVertex nextEdgeVertex vtxList1 vtxList2 |
	self isSleeve ifFalse:[^#()].
	faces := WriteStream on: #().
	e1 isBorderEdge ifTrue:[lastEdge := e2. nextEdge := e3].
	e2 isBorderEdge ifTrue:[lastEdge := e3. nextEdge := e1].
	e3 isBorderEdge ifTrue:[lastEdge := e1. nextEdge := e2].
	lastEdgeVertex := lastEdge center @ lastEdge elevationHeight.
	nextEdgeVertex := nextEdge center @ nextEdge elevationHeight.
	"Elevate fan vertices, if any"
	lastEdge fanVertices ifNotNil:[
		faces nextPutAll: (self elevateFan: lastEdge fanVertices to: lastEdgeVertex steps: nSteps)].
	nextEdge fanVertices ifNotNil:[
		faces nextPutAll: (self elevateFan: nextEdge fanVertices to: nextEdgeVertex steps: nSteps)].
	"Connect edges"
	vtxList1 := self elevateFrom: lastEdge origin @ 0 to: lastEdgeVertex steps: nSteps.
	vtxList2 := self elevateFrom: nextEdge destination @ 0to: nextEdgeVertex steps: nSteps.
	self elevateConnect: vtxList1 with: vtxList2 into: faces.
	vtxList1 := self elevateFrom: nextEdge origin @ 0 to: nextEdgeVertex steps: nSteps.
	vtxList2 := self elevateFrom: lastEdge destination @ 0 to: lastEdgeVertex steps: nSteps.
	self elevateConnect: vtxList1 with: vtxList2 into: faces.
	^faces contents