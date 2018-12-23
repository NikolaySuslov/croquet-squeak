transform
rotateBy: anAngle around: aVector3
	^self transformBy: (Quaternion angle: anAngle axis: aVector3) asMatrix4x4