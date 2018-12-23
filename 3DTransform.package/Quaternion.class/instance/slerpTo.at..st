interpolating
slerpTo: aRotation at: t
	"Spherical linear interpolation (slerp) from the receiver to aQuaternion"
	^self slerpTo: aRotation at: t extraSpins: 0