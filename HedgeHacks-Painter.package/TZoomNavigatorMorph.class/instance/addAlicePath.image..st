alice items
addAlicePath: path image: aForm
	| image |
	aForm ifNil:[image := Form extent: 128@128 depth: 32].
	aForm ifNotNil:[
		image := Form extent: aForm extent depth: 32.
		aForm displayOn: image.
	].
	self drawName: (path copyFrom: (path lastIndexOf: $/) to: path size) on: image.
	self addItem: (TSketchButtonMorph withForm: image)
		dragAction: nil
		clickAction: (MessageSend receiver: self selector: #clickOpenAlicePath: argument: path).