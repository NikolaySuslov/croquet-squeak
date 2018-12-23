drawing
mouseUp: evt
	| myAction |
	"Do nothing except those that work on mouseUp."

	myAction := palette action.
	myAction == #fill: ifTrue: [
		self perform: myAction with: evt.
		"Each action must do invalidRect:"
		].
	myAction == #pickup: ifTrue: [
		self pickupMouseUp: evt].
	myAction == #polygon: ifTrue: [self polyEdit: evt].	"a mode lets you drag vertices"
	self lastEvent: nil.
