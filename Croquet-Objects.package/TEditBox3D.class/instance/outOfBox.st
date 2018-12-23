initialize
outOfBox

	ghostFrame ifNil:[^super outOfBox.].

	self removeChild: ghostChild.
	ghostFrame removeChild: ghostParent.
