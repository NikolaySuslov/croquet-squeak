events
onKeyboardEvent: evtBuf
	"Handle a mouse event"
	| evtType pressCode |
	evtType := evtBuf at: 1.
	pressCode := EventKeyChar.
	evtType == #keyDown ifTrue:[pressCode := EventKeyDown].
	evtType == #keyUp ifTrue:[pressCode := EventKeyUp].
	self processEvent: {
		EventTypeKeyboard. 	"type"
		(evtBuf at: 2).		"time stamp"
		(evtBuf at: 5).		"character value"
		pressCode.			"press code"
		(evtBuf at: 3) bitShift: -3. "modifiers; no buttons"
		0.					"reserved"
		0.					"reserved"
		0.					"windowIndex"
	} userID: (evtBuf at: 4).
