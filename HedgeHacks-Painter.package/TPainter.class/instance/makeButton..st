initialize
makeButton: label
	| button |
	button := TButtonMorph new.
	button label: label.
	button fullBounds.
	button vResizing: #rigid.
	^button