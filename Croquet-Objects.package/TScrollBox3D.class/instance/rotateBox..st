actions
rotateBox: pointer

	| dir |
	dir := (selectedFrame translation cross: boxPoint) abs .
	radius := boxPoint length.
	dir x > dir y ifTrue:[
		dir x > dir z ifTrue:[ self rotateBoxX: pointer. ] ifFalse:[ self rotateBoxZ: pointer]
	]ifFalse:[
		dir y > dir z ifTrue:[ self rotateBoxY: pointer. ] ifFalse:[ self rotateBoxZ: pointer]
	].
