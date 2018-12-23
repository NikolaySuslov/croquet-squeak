initialize
initialize: n
	n = 0 ifTrue:[data := #()] ifFalse:[data := Array new: n].