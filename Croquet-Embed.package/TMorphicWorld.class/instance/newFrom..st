initialize
newFrom: appData
	"Do whatever is necessary to instantiate the receiver from the provided appData"
	self perform: (appData at: 1) asSymbol withArguments: appData allButFirst.
	app future startStepping. "make sure we're going"