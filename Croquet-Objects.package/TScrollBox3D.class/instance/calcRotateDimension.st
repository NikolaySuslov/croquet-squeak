actions
calcRotateDimension

	| dir  |

	dir := (selectedFrame translation cross: boxPoint) abs .
	radius := boxPoint length.
	dir x > dir y ifTrue:[
		dir x > dir z ifTrue:[ selectedAction := #rotateBoxX:. ] ifFalse:[  selectedAction := #rotateBoxZ:]
	]ifFalse:[
		dir y > dir z ifTrue:[selectedAction := #rotateBoxY:. ] ifFalse:[ selectedAction := #rotateBoxZ:]
	].
