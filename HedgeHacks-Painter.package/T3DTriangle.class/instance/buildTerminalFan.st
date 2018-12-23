spine
buildTerminalFan
	| firstEdge pt points lastEdge nextEdge inside |
	self isTerminal ifFalse:[^self].
	e1 isBorderEdge ifFalse:[firstEdge := e1. pt := e3 origin].
	e2 isBorderEdge ifFalse:[firstEdge := e2. pt := e1 origin].
	e3 isBorderEdge ifFalse:[firstEdge := e3. pt := e2 origin].
	firstEdge ifNil:[^self].
	points := OrderedCollection new.
	lastEdge := firstEdge.
	points add: lastEdge destination; add: pt; add: lastEdge origin.
	nextEdge :=  lastEdge leftFace oppositeSpineEdgeOf: lastEdge symmetric.
	[lastEdge rightFace isValid: false.
	nextEdge notNil and:[nextEdge fanVertices isNil]] whileTrue:[
		nextEdge origin = points first ifTrue:[
			points addLast: nextEdge destination
		] ifFalse:[nextEdge origin = points last ifTrue:[
			points addFirst: nextEdge destination.
		] ifFalse:[nextEdge destination = points first ifTrue:[
			points addLast: nextEdge origin.
		] ifFalse:[nextEdge destination = points last ifTrue:[
			points addFirst: nextEdge origin.
		] ifFalse:[self error:'I am confused']]]].
		inside := nextEdge hasAllInsideCircle: points.
		lastEdge := nextEdge.
		inside
			ifTrue:[nextEdge := lastEdge leftFace oppositeSpineEdgeOf: lastEdge symmetric]
			ifFalse:[nextEdge := nil].
	].
	lastEdge symmetric fanVertices: points.