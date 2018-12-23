actions
selectChild
	| eb sel |

	self parent ifNil: [^nil.].

	contents frameChildren ifNotNil:[
		contents frameChildren size > 0 ifTrue:[
			eb:= TEditBox3D new.
			sel := contents frameChildren at: 1.
			self delete.
			eb initializeWithContents: sel editPortal: editPortal.
			editPortal ifNotNil:[editPortal selection: eb.].
			].
		].
