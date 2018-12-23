display
forceDisplayUpdate
	"Make sure pending changes will be committed to the embedded app"
	display updateRect ifNotNil:[TEmbeddedApp updateDisplay: display app: self].