accessing
windowColor: windowColor
	| buttonColor |
	self fillStyle: (GradientFillStyle colors: {windowColor. Color white mixed: 0.65 with: windowColor}).
	self fillStyle origin: 0@0; direction: 0@24.
	buttonColor := (windowColor mixed: 0.3 with: Color white).
	closeButton color: buttonColor.
	collapseButton color: buttonColor.
	expandButton color: buttonColor.
	doItButton ifNotNil:[doItButton color: buttonColor].