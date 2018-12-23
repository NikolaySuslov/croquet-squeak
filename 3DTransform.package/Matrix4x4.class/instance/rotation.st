accessing
rotation
	"Return the angular rotation around each axis of the matrix"

	| vRow1 vRow2 vRow3 vScale vShear vAngles vRowCross determinate |

	vRow1 := self row1.
	vRow2 := self row2.
	vRow3 := self row3.

	vScale := Vector3 new.
	vShear := Vector3 new.
	vAngles := Vector3 new.

	vScale at: 1 put: (vRow1 length).
	vRow1 normalize.
	vShear at: 1 put: (vRow1 dot: vRow2).
	vRow2 := vRow2 + (vRow1 * ((vShear at: 1) negated)).

	vScale at: 2 put: (vRow2 length).
	vRow2 normalize.
	vShear at: 1 put: ((vShear at: 1) / (vScale at: 2)).

	vShear at: 2 put: (vRow1 dot: vRow3).
	vRow3 := vRow3 + (vRow1 * ((vShear at: 2) negated)).

	vShear at: 3 put: (vRow2 dot: vRow3).
	vRow3 := vRow3 + (vRow2 * ((vShear at: 3) negated)).

	vScale at: 3 put: (vRow3 length).
	vRow3 normalize.

	vShear at: 2 put: ((vShear at: 2) / (vScale at: 3)).
	vShear at: 3 put: ((vShear at: 3) / (vScale at: 3)).

	vRowCross := vRow2 cross: vRow3.
	determinate := vRow1 dot: vRowCross.

	(determinate < 0.0) ifTrue: [ vRow1 := vRow1 negated.
								vRow2 := vRow2 negated.
								vRow3 := vRow3 negated.
								vScale := vScale negated. ].

	vAngles at: 2 put: ((vRow1 at: 3) negated) arcSin.

	(((vAngles at: 2) cos) ~= 0.0) 
								ifTrue: [ vAngles at: 1 put:
												((vRow2 at: 3) arcTan: (vRow3 at: 3)).
										  vAngles at: 3 put:
												((vRow1 at: 2) arcTan: (vRow1 at: 1)). ]
								ifFalse: [ vAngles at: 1 put:
												((vRow2 at: 1) arcTan: (vRow2 at: 2)).
										  vAngles at: 3 put: 0.0 ].


	vAngles at: 1 put: ((vAngles at: 1) radiansToDegrees).
	vAngles at: 2 put: ((vAngles at: 2) radiansToDegrees).
	vAngles at: 3 put: ((vAngles at: 3) radiansToDegrees).

	^ vAngles.
