initialize
initialize: embeddedApp data: appData extent: appExtent
	"Initialize the receiver. Subclasses should put most of their initialization into #newFrom:"
	app := embeddedApp.
	extent := appExtent.

	"Create our display"
	display := TForm new 
		initialize: nil sha: (app get: #displaySHA)
		form: ((Form extent: appExtent depth: 32) fillColor: Color transparent)
		mipmap: true shrinkFit: false extension: nil.

	"Initialize events"
	self initializeEvents.

	"Instantiate the app-specific parts"
	self newFrom: appData.

	"And redraw initially"
	self redraw.