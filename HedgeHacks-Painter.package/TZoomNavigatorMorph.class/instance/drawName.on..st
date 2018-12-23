initialize
drawName: projectName on: aForm
	| font nameForm box rectForName aCanvas |
	font := TextStyle defaultFont emphasized: 1.
	nameForm := (StringMorph contents: projectName font: font) imageForm.
	nameForm := nameForm scaledToSize: (aForm extent - (4@2) min: nameForm extent).
	box := aForm boundingBox.
	rectForName := box bottomLeft + 
			(box width - nameForm width // 2 @ (nameForm height + 2) negated)
				extent: nameForm extent.
	aCanvas := aForm getCanvas.
	rectForName topLeft eightNeighbors do: [ :pt |
		aCanvas
			stencil: nameForm 
			at: pt
			color: Color white.
	].
	aCanvas
		stencil: nameForm 
		at: rectForName topLeft 
		color: Color black.