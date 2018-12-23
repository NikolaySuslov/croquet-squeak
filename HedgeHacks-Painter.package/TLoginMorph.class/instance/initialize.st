initialize
initialize
	| fs |
	super initialize.
	self beSticky.
	fs := GradientFillStyle ramp: {0.0 -> (Color r: 0.8 g: 0.8 b: 1.0). 1.0 -> (Color white) }.
	self vResizing: #shrinkWrap.
	self hResizing: #shrinkWrap.
	color := Color paleYellow.
	borderWidth := 4.
	borderColor := #complexRaised.
	self layoutInset: (4@6).
	self rebuild.
	fs origin: bounds origin.
	fs direction: 0@self fullBounds height.
	self fillStyle: fs.