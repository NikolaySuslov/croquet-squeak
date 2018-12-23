initialize
updateBox

	| mn mx corner extent center delta |
	self resetBox.
	box := self getBox: contents.
	mn := box min.
	mx := box max.

	corner := (mx-mn).
	extent := (box extent x + box extent y + box extent z)/2.5/sideScale.
"	extent := box extentMax/scale."

	corner := 1.01*(corner-extent)/2.0.
	corner := corner max: extent@extent@extent.
	mx := mx max: (box center + ((extent@extent@extent)*1.5)).
	mn := mn min: (box center -((extent@extent@extent)*1.5)).
	delta := 1.01*(mx-mn/2.0).
	center := box center+(box center negated).
	(sides at: 1) translation:  center+(0@delta y@0).
	(sides at: 2) translation:  center-(0@delta y@0).
	(sides at: 3) translation:  center-(delta x@0@0).
	(sides at: 4) translation:  center+(delta x@0@0).
	(sides at: 5) translation:  center-(0@0@delta z).
	(sides at: 6) translation:  center+(0@0@delta z).

{ 	corner x@corner z@0. 
	corner x@corner z@0. 
	corner z@corner y@0. 
	corner z@corner y@0.
	corner x@corner y@0.
	corner x@corner y@0. }
	doWithIndex:[ :crnr : index| | group |
		group := sides at: index.
		group frameChildren do:[ :fc | fc extent: extent@extent.].
		(group frameChildren at: 1) translation: (crnr x@crnr y@0).
		(group frameChildren at: 2) translation: (crnr x@crnr y negated@0).
		(group frameChildren at: 3) translation: (crnr x negated@crnr y@0).
		(group frameChildren at: 4) translation: (crnr x negated@crnr y negated@0).

		(group frameChildren at: 5) translation: (crnr x @ 0 @ 0).
		(group frameChildren at: 6) translation: (0 @ crnr y @ 0).
		(group frameChildren at: 7) translation: (crnr x negated@ 0 @ 0).
		(group frameChildren at: 8) translation: (0 @ crnr y negated @ 0).
		].
