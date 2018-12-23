initialize
buildWindowButton: graphic
	| button icon |
	button := (BorderedMorph new)
		extent: 16@16;
		cornerStyle: #rounded;
		color: Color gray;
		borderStyle: (BorderStyle raised width: 2);
		yourself.
	button on: #mouseDown send: #mouseDown:from: to: self.
	button on: #mouseUp send: #mouseUp:from: to: self.
	graphic ifNil:[^button].
	icon := SketchMorph withForm: graphic.
	button addMorphCentered: icon.
	^button