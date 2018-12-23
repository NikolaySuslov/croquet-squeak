initialize
makeControlButton: aLabel after: prevButton
	| button label |
	button := window frame buildWindowButton: nil.
	label := StringMorph contents: aLabel.
	label emphasis: 1.
	aLabel size > 1 ifTrue:[button width: label width + 10].
	button addMorphCentered: label.
	window frame addMorph: button after: prevButton.
	button color: window frame closeButton color.
	^button