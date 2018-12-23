back button
addBackButton: contentType
	| prior button |
	button := TSketchButtonMorph withForm: BackButtonForm.
	button setProperty: #contentType toValue: contentType.
	prior := scroller submorphs.
	scroller removeAllMorphs.
	self addItem: button
		dragAction: nil
		clickAction: (MessageSend receiver: self selector: #clickBackTo: argument: prior).