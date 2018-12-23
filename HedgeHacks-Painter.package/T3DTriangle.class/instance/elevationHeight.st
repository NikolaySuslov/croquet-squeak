elevation
elevationHeight
	"Compute the elevation height of the receiver"
	| center sum count |
	center := self center.
	sum := (center dist: e1 origin) + (center dist: e2 origin) + (center dist: e3 origin).
	count := 3.
true ifTrue:[^sum / count].
	e1 fanVertices ifNotNilDo:[:vtx|
		vtx do:[:v| sum := sum + (v dist: center)].
		count := count + vtx size].
	e2 fanVertices ifNotNilDo:[:vtx|
		vtx do:[:v| sum := sum + (v dist: center)].
		count := count + vtx size].
	e3 fanVertices ifNotNilDo:[:vtx|
		vtx do:[:v| sum := sum + (v dist: center)].
		count := count + vtx size].
	^sum / count asFloat