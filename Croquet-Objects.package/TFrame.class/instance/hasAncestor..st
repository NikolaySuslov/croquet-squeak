hierarchy
hasAncestor: ancestor

"Determines if ancestor is one of our parents, parents parents, etc..."
	frameParent = ancestor ifTrue:[^ true].
	frameParent ifNil:[^ false].
	^ frameParent hasAncestor: ancestor.
