initialize
beBordered
	| newLabel |
	newLabel := BorderedStringMorph contents: self label.
	self replaceSubmorph: label by: newLabel.
	label := newLabel.