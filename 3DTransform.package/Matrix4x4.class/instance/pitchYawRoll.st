accessing
pitchYawRoll
	"Assume the receiver describes an orthonormal 3x3 matrix"
	| pitch yaw roll |
	pitch := self a23 negated arcSin.
	yaw := self a13 arcTan: self a33.
	roll := self a21 arcTan: self a22.
	^pitch radiansToDegrees@yaw radiansToDegrees@roll radiansToDegrees