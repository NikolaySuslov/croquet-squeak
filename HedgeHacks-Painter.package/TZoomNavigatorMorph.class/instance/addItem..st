initialize
addItem: sketch
	sketch extent: self smallExtent.
	sketch on: #mouseDown send: #mouseDown:from: to: self.
	sketch on: #mouseUp send: #mouseUp:from: to: self.
	sketch on: #mouseEnter send: #mouseEnter:from: to: self.
	sketch on: #mouseLeave send: #mouseLeave:from: to: self.
	sketch on: #startDrag send: #startDrag:from: to: self.
	scroller addMorphBack: sketch.
	scroller left: self left.