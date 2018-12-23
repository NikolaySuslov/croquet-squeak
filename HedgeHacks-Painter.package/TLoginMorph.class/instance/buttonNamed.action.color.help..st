building
buttonNamed: aString action: aSymbol color: aColor help: helpString

	| f col |
	f := SimpleButtonMorph new
		target: self;
		label: aString font: self myFont;
		color: aColor;
		actionSelector: aSymbol;
		setBalloonText: helpString.
	f width: 80.
	f cornerStyle: #square.
	f color: (Color r: 0.95 g: 0.95 b: 1.0).
	f borderStyle: (BorderStyle raised width: 2).
	col := (self inAColumn: {f}) hResizing: #spaceFill.
	^col