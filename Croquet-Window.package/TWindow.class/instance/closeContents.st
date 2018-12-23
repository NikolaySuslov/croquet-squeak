actions
closeContents
	contents ifNotNil:[
		contentsOn ifTrue:[
			self removeChild: rectFront.
			rectFront := saveContents.
			contentsOn := false.
			self addChild: rectFront.
			contents3D ifTrue:[self addChild: rectBack].
			self extent: rectFront extent asPoint.
			windowButtons showOpenButton.
			].
		].
