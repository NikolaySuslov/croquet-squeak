initialize
buildDoItButton
	| button doIt |
	button := (BorderedMorph new)
		extent: 16@16;
		cornerStyle: #rounded;
		color: Color gray;
		borderStyle: (BorderStyle raised width: 2);
		yourself.
	button on: #mouseDown send: #mouseDown:from: to: self.
	button on: #mouseUp send: #mouseUp:from: to: self.
	doIt := StringMorph contents: '!'.
	doIt emphasis: 1.
	button addMorphCentered: doIt.
	doItButton := button.
	^doItButton