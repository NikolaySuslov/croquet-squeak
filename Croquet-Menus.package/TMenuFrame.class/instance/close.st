initialize
close
	self selectItemIndex: 0.
	parentMenu ifNotNil:[parentMenu subMenuClosed: self].
	self delete.
"	frameParent ifNotNil:[frameParent removeChild: self]."