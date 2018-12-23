actions
selectRightSibling
	|  siblings next eb |
	self parent ifNil: [^nil.].

	siblings := self parent frameChildren.

	siblings size > 1 ifTrue:[
		next := siblings next: self.
		self delete.
		eb := TEditBox3D new.
		eb initializeWithContents: next editPortal: editPortal.
		editPortal ifNotNil:[editPortal selection: eb.].
		].
