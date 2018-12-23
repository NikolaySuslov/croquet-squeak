events
onMouseEvent: evtBuf
	"Handle mouse input only"
	| buttons |
	buttons := evtBuf at: 3.
	self redraw: (buttons anyMask: 1). "highlight if left button is pressed"