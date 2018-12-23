arithmetic
normalize
	"Normalize the receiver. Note that the actual angle (a) determining the amount of 
	rotation is fixed, since we do not want to modify angles. This leads to:
		a^2 + b^2 + c^2 + d^2 = 1.
		b^2 + c^2 + d^2 = 1 - a^2.
	Note also that the angle (a) can not exceed 1.0 (due its creation by cosine) and
	if it is 1.0 we have exactly the unit quaternion ( 1, [ 0, 0, 0]).
	"
	| oneMinusASquared length |
	oneMinusASquared := 1.0 - (self a squared).
	(oneMinusASquared < 1.0e-10) ifTrue:[^self setIdentity].
	length := ((self b squared + self c squared + self d squared) / oneMinusASquared) sqrt.
	length = 0.0 ifTrue:[^self setIdentity].
	self b: self b / length.
	self c: self c / length.
	self d: self d / length.
