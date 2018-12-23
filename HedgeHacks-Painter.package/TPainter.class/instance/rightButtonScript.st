actions
rightButtonScript
	| labels newLabel |
	labels := #('Left' 'Forward' 'Right' 'Back').
	newLabel :=  labels atWrap: (labels indexOf: rightButton label) + 1.
	rightButton label: newLabel.
	newLabel :=  labels atWrap: (labels indexOf: newLabel) + 2.
	leftButton label: newLabel.
	leftButton align:  leftButton fullBounds bottomLeft with: editor bounds bottomLeft.
	rightButton align: rightButton fullBounds bottomRight with: editor bounds bottomRight.
