events
onMouseEvent: evtBuf
	"Transform into Morphic event buffer"
	self processEvent: {
		EventTypeMouse. 	"type"
		(evtBuf at: 2).		"time stamp"
		(evtBuf at: 5) x.		"mouse x"
		(evtBuf at: 5) y.	"mouse y"
		(evtBuf at: 3) bitAnd: 7. 	"mouse buttons"
		(evtBuf at: 3) bitShift: -3.	"keyboard modifiers"
		0. 					"reserved"
		0.					"windowIndex"
	} userID: (evtBuf at: 4).
