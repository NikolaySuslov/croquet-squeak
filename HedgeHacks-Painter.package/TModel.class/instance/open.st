as yet unclassified
open
	window := TWindowMorph new.
	window model: self.

	window frame alphaSlider hResizing: #spaceFill.
	window model: self.
	window content addMorph: ((BorderedMorph new) borderColor: #inset; color: Color transparent) frame: (0@0 corner: 1@1).
	window windowColor: self windowColor.
	window extent: 256@256.
	World addMorphFront: window.
	^window