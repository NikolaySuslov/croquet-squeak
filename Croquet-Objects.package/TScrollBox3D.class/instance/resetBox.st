initialize
resetBox

	contents localTransform: (self localTransform composeWith: contents localTransform).

	box := self getBox:contents.
	self localTransform: contents localTransform.
	self translation: self translation + (self orientation localPointToGlobal:box center).
	contents localTransform: Matrix4x4 identity.
	contents translation: (box center negated).
