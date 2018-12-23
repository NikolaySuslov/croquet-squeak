instance creation
rotatedBy: angle around: axis centeredAt: origin
	"Create a matrix rotating points around the given origin using the angle/axis pair"
	| xform |
	xform := self withOffset: origin negated.
	xform := xform composedWithGlobal:(Quaternion angle: angle axis: axis) asMatrix4x4.
	xform := xform composedWithGlobal: (self withOffset: origin).
	^xform