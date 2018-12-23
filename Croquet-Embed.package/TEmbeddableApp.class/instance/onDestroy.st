events
onDestroy
	"Note: This signals an in-space destruction only (which is rare). 
	If the whole world goes away #destroy will be called directly from the harness."
	self log debug: '{Destroying Embeddable App}'.
	self destroy.
	app := nil.