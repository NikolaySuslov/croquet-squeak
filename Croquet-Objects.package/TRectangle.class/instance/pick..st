render
pick: pointer
	| dx dy |

	dx := self extent x/2.
	dy := self extent y/2.

	flip ifFalse:[
	^ pointer pickQuad: norm
		q1: (Vector3 x: location x + dx negated y: location y + dy z: location z)
		q2: (Vector3 x: location x + dx negated y: location y + dy negated z: location z)
		q3: (Vector3 x: location x + dx y: location y + dy negated z: location z)
		q4: (Vector3 x: location x + dx y: location y + dy z: location z).
		]
	ifTrue:[
	^ pointer pickQuad: norm
		q1: (Vector3 x: location x + dx y: location y + dy z: location z)
		q2: (Vector3 x: location x + dx y: location y + dy negated z: location z)
		q3: (Vector3 x: location x + dx negated y: location y + dy negated z: location z)
		q4: (Vector3 x: location x + dx negated y: location y + dy z: location z).]
