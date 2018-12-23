picking
pickBoundSphere: bnds 
	| position dp d gpAt |

	gpAt := self globalTransform column3.
	position := bnds globalPosition - self globalPosition.
	dp := position - ((gpAt dot: position)*gpAt).
	d := dp dot: dp.
	d < bnds radiusSquared ifTrue:[
		self sphereDistSquared: d.
		^ true.].
	^ false.