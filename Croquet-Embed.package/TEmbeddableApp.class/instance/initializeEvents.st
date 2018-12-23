initialize
initializeEvents
	"Set up the event handling mechanism"
	self runScript: #onStep: when:{app. #step}.
	self runScript: #onDestroy when:{app. #destroy}.
	self runScript: #onMouseEvent: when:{app. #mouseEvent}.
	self runScript: #onKeyboardEvent: when:{app. #keyboardEvent}.
	self runScript: #onAppExtentChanged: when:{app. #appExtentChanged}.
	self runScript: #onContainerClosed: when:{app. #containerHasClosed}.
	self runScript: #onContainerOpened: when:{app. #containerHasOpened}.
