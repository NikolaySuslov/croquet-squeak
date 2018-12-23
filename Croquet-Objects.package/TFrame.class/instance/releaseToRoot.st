transform
releaseToRoot

	"Transfer the frame from the current parent to the root frame while keeping the pose in exactly the same orientation"

	| trans root |
	trans := self globalTransform.
	root := self root.
	self transferTo: root.
	self localTransform: trans.
