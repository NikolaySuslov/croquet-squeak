event handling
mouseEnter: evt

	evt setPosition: evt position - self bounds topLeft.
	evt hand newKeyboardFocus: self.