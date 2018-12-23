accessing
boundingBox
	"Answer the bounding box for the receiver and its children"
	^ self boundingBox: Matrix4x4 identity.
