initialize
intoBox

	ghostFrame ifNil:[^super intoBox.].
	ghostParent := ghostParent ifNil:[ TGroup new ].
	ghostParent localTransform: contents parent globalTransform copy.
	ghostFrame addChild: ghostParent.
	ghostChild := ghostChild ifNil:[TGroup new].
	ghostChild localTransform: contents localTransform copy.
	ghostParent addChild: ghostChild.

	box := self getBox: contents.
	self localTransform: ghostChild localTransform copy.
	self translation: self translation + (self orientation localPointToGlobal:box center).
	ghostChild localTransform: Matrix4x4 identity.
	ghostChild translation: (box center negated).
	ghostChild insertFrame: self.
	