spine
oppositeSpineEdgeOf: someEdge
	self isSleeve ifFalse:[^nil].
	someEdge == e1 ifTrue:[
		(e2 leftFace notNil and:[e3 leftFace isNil]) ifTrue:[^e2].
		(e3 leftFace notNil and:[e2 leftFace isNil]) ifTrue:[^e3].
		^nil].
	someEdge == e2 ifTrue:[
		(e1 leftFace notNil and:[e3 leftFace isNil]) ifTrue:[^e1].
		(e3 leftFace notNil and:[e1 leftFace isNil]) ifTrue:[^e3].
		^nil].
	someEdge == e3 ifTrue:[
		(e1 leftFace notNil and:[e2 leftFace isNil]) ifTrue:[^e1].
		(e2 leftFace notNil and:[e1 leftFace isNil]) ifTrue:[^e2].
		^nil].
	self error:'Edge not in receiver'