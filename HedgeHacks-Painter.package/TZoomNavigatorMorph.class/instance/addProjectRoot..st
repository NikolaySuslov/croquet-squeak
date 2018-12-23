project items
addProjectRoot: thumb
	| image |
	image := Form extent: thumb extent depth: 32.
	thumb displayOn: image.
	self drawName: 'Projects' on: image.
	self addItem: (TSketchButtonMorph withForm: image)
		dragAction: nil
		clickAction: (MessageSend receiver: self selector: #addProjects).
