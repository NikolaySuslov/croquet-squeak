actions
selectLeftSibling
	|  siblings previous eb |

	self parent ifNil: [^nil.].

	siblings := self parent frameChildren.

	siblings size > 1 ifTrue:[
		previous := siblings previous: self.
		self delete.
		eb := TEditBox3D new. 
		eb initializeWithContents: previous editPortal: editPortal.
		editPortal ifNotNil:[editPortal selection: eb.].
		].
