initialize
initializeEvents
	"Set up the event handling mechanism"
	super initializeEvents.
	"This is the event we use for slide show synchronization"
	self startScript: #onUpdateImage: when:{app. #updateImage}.