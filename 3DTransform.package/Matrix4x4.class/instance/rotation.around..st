accessing
rotation: anAngle around: aVector3
	"set up a rotation matrix around the direction aVector3"

	self loadFrom: (Quaternion angle: anAngle axis: aVector3) asMatrix4x4