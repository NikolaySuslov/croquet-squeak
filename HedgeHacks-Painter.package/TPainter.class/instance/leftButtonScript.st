actions
leftButtonScript
	| labels newLabel |
	labels := #('Left' 'Forward' 'Right' 'Back').
	newLabel :=  labels atWrap: (labels indexOf: leftButton label) + 1.
	leftButton label: newLabel.
	newLabel :=  labels atWrap: (labels indexOf: newLabel) + 2.
	rightButton label: newLabel.
	leftButton align:  leftButton fullBounds bottomLeft with: editor bounds bottomLeft.
	rightButton align: rightButton fullBounds bottomRight with: editor bounds bottomRight.
