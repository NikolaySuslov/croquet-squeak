events
onKeyboardEvent: evtBuf
	"Handle keyboard input. EvtBuf is an array consisting of:
		1: Event type (keyDown, keystroke, keyUp etc)
		2: Original time stamp of event
		3: Mouse button and modifier (Alt, Ctrl, Shift) state
		4: User id
		5: Character value
	"