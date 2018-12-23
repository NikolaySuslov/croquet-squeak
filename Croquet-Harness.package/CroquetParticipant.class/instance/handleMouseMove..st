event handling
handleMouseMove: anEvent
	"Reimplemented to get #mouseOver: messages"
	self mouseOver: anEvent.
	super handleMouseMove: anEvent.