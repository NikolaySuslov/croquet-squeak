actions
openContents

	contents ifNotNil:[
		contentsOn ifFalse:[
			self removeChild: rectFront.
			contents3D ifTrue:[self removeChild: rectBack.].
			contentsOn := true.
			rectFront := contents.
			self addChild: rectFront.
			self extent: windowFrame extent asPoint.
			windowButtons showCloseButton.
			].
		].
