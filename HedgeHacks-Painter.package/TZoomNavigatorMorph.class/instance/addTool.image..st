tools
addTool: toolClass image: icon
	| sketch image |
	image := Form extent: icon extent depth: 32.
	icon displayOn: image.
	self drawName: toolClass name on: image.
	sketch := TSketchButtonMorph withForm: image.
	sketch setProperty: #clickAction toValue: (MessageSend receiver: self selector: #openTool: argument: toolClass).
	tools add: sketch.