event handling
mouseUp: evt
	self borderStyle: (BorderStyle complexRaised width: self borderWidth).
	(self containsPoint: evt position) ifTrue:[self signal: #fire].