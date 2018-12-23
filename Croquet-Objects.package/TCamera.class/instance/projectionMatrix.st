transform
projectionMatrix
	"Answer the projection matrix for the receiver"
	| m sine cotangent deltaZ radians aspect |
	aspect := bounds width asFloat / bounds height.
	m := Matrix4x4 identity.
	radians := (viewAngle / 2.0)*(Float pi / 180.0).
	sine := radians sin.
	deltaZ := zFar - zNear.
	cotangent := radians cos / sine.
	m a11: cotangent / aspect.
	m a22: cotangent.
	m a33: ((zFar + zNear) negated) / deltaZ.
	m a34: -2 * zNear * zFar / deltaZ.
	m a43: -1.
	m a44: 0.
	^m