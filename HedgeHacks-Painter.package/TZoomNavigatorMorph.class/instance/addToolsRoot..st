tools
addToolsRoot: thumb
	| image |
	image := Form extent: thumb extent depth: 32.
	thumb displayOn: image.
	self drawName: 'Tools' on: image.
	self addItem: (TSketchButtonMorph withForm: image)
		dragAction: nil
		clickAction: (MessageSend receiver: self selector: #addTools).
