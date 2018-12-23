alice items
addAliceFile: path image: aForm
	| image |
	image := aForm ifNil:[Form extent: 128@96 depth: 8].
	self drawName: (path copyFrom: (path lastIndexOf: $/) to: path size) on: image.
	self addItem: (TSketchButtonMorph withForm: image)
		dragAction: nil
		clickAction: (MessageSend receiver: self selector: #clickOpenAliceFile: argument: path).