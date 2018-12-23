hierarchy
hasAncestorOrMe: ancestor

"Determines if ancestor is one of our parents, parents parents, etc..."
	self = ancestor ifTrue:[^ true].
	^ self hasAncestor: ancestor.
