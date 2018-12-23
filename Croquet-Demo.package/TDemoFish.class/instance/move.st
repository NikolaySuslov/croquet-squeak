stepping
move
	| distanceBefore distanceAfter incSpeed |

	target ifNil:[^self].
	"Compute the incremental speed" 
	incSpeed := speed / 20.0.

	"Compute the distance to the target"
	distanceBefore := self distanceTo: target.

	"Now move..."
	self forward: incSpeed.

	"If we're far away then move faster"
	distanceBefore > 50 ifTrue:[
		self forward: 4*incSpeed.
	].

	distanceBefore > 25 ifTrue:[
		self forward: 2*incSpeed.
	].
	"If we're relatively far away, then see if
	we're running away from the target. If so,
	turn around a little so that we get back on track."
	distanceBefore > 5 ifTrue:[
		distanceAfter := self distanceTo: target.
		distanceAfter > distanceBefore ifTrue:[
			self turn: (-25 to: 25) atRandom.
		].
	].
	self turn: (-5 to: 5) atRandom.
	(self future: 200)move.
