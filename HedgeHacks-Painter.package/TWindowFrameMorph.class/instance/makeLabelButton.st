initialize
makeLabelButton
	| newLabel |
	newLabel := TButtonMorph new.
	newLabel fillStyle direction: newLabel fillStyle direction * 2.
	"newLabel cornerStyle: #rounded."
	newLabel label: self label.
	newLabel labelColor: self labelColor.
	newLabel fullBounds.
	newLabel position: label position.
	newLabel highlightWidth: 2.
	label owner replaceSubmorph: label by: newLabel.
	label delete.
	label := newLabel.
	^label