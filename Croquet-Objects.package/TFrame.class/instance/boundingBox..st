accessing
boundingBox: trans
	"Answer the bounding box for the receiver and its children"
	| box childBox |
	box := self frameBox.
	self frameChildrenDo:[:child|
		childBox := child boundingBox transformedBy: (trans * child localTransform).
		box := box merge: childBox.
	].
	^box