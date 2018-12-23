initialize
intoBox

	box := self getBox:contents.
	self localTransform: contents localTransform.
	self translation: self translation + (self orientation localPointToGlobal:box center).
	contents localTransform: Matrix4x4 identity.
	contents translation: (box center negated).
	contents insertFrame: self.