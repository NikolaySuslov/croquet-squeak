actions
selectParent
	| par eb |
	self parent ifNotNil: [ "we are the root"
		self parent ~= self root ifTrue:[ " don't select the root, as that would be really hard to edit"
		par := self parent.
		self delete.
		eb := TEditBox3D new.
		eb initializeWithContents: par editPortal: editPortal.
		editPortal ifNotNil:[editPortal selection: eb.].
		].
	].
		