transform
newRoot: newRoot newTransform: newTransform
	| oldRoot |
	oldRoot := self root.

	self signal: #spaceLeave with: oldRoot.
	oldRoot signal: #objectLeave with: self.

	self parent removeChild: self.
	newRoot addChild: self.
	self localTransform: newTransform.

	self signal: #spaceEnter with: newRoot.
	newRoot signal: #objectEnter with: self.