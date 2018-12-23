initialize
open
	window := TWindowMorph new.
	window model: self.

	window frame expandButton delete.
	window frame alphaSlider hResizing: #spaceFill.
	window model: self.
	window windowColor: self windowColor.
	window label: 'Tea Paint'.
	window extent: 440@350.
	window fullBounds.

	self makePainter.
	self makeControlButtons.

	World addMorphFront: window.
	^window