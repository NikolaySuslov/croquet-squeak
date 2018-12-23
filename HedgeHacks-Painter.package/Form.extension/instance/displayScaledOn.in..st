*HedgeHacks-Painter
displayScaledOn: aForm in: aRectangle
	"Display the receiver on aForm, scaling if necessary.
		Form fromUser displayScaledOn: Display.
	"
	self extent = aForm extent ifTrue:[^self displayOn: aForm].
	(WarpBlt current toForm: aForm)
		sourceForm: self destRect: aRectangle;
		combinationRule: Form paint;
		cellSize: 2;
		warpBits.