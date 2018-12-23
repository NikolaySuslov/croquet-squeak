accessing
rotation: aVector
	| xRot yRot zRot cosPitch sinPitch cosYaw sinYaw cosRoll sinRoll |

	xRot := (aVector x) degreesToRadians.
	yRot := (aVector y) degreesToRadians.
	zRot := (aVector z) degreesToRadians.

	cosPitch := xRot cos.
	sinPitch := xRot sin.
	cosYaw := yRot cos.
	sinYaw := yRot sin.
	cosRoll := zRot cos.
	sinRoll := zRot sin.

	self a11: (cosRoll*cosYaw).
	self a12: (sinRoll*cosYaw).
	self a13: (sinYaw negated).

	self a21: ((cosRoll*sinYaw*sinPitch) - (sinRoll*cosPitch)).
	self a22: ((cosRoll*cosPitch) + (sinRoll*sinYaw*sinPitch)).
	self a23: (cosYaw*sinPitch).
	self a31: ((cosRoll*sinYaw*cosPitch) + (sinRoll*sinPitch)).
	self a32: ((sinRoll*sinYaw*cosPitch) - (cosRoll*sinPitch)).
	self a33: (cosYaw*cosPitch).

	^ self.
